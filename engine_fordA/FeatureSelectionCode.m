%% nca
load ovariancancer; 
whos
rng(1); % For reproducibility
cvp = cvpartition(grp,'holdout',56)
Xtrain = obs(cvp.training,:);
ytrain = grp(cvp.training,:);
Xtest  = obs(cvp.test,:);
ytest  = grp(cvp.test,:);


Xtrain = FordATRAIN1(:,2:501);
ytrain = FordATRAIN1(:,1);
Xtest = FordATEST(:,2:501);
ytest = FordATEST(:,1);

nca = fscnca(Xtrain,ytrain,'FitMethod','none');
L = loss(nca,Xtest,ytest)
nca = fscnca(Xtrain,ytrain,'FitMethod','exact','Lambda',0,...
      'Solver','lbfgs','Standardize',true);
L = loss(nca,Xtest,ytest)
cvp = cvpartition(ytrain,'kfold',5);
numvalidsets = cvp.NumTestSets;
n = length(ytrain);
lambdavals = linspace(0,20,20)/n;
lossvals = zeros(length(lambdavals),numvalidsets);
for i = 1:length(lambdavals)
    for k = 1:numvalidsets
        X = Xtrain(cvp.training(k),:);
        y = ytrain(cvp.training(k),:);
        Xvalid = Xtrain(cvp.test(k),:);
        yvalid = ytrain(cvp.test(k),:);

        nca = fscnca(X,y,'FitMethod','exact', ...
             'Solver','sgd', 'Verbose',1,'Lambda',lambdavals(i), ...
             'IterationLimit',30,'GradientTolerance',1e-4, ...
             'Standardize',true);
                  
        lossvals(i,k) = loss(nca,Xvalid,yvalid,'LossFunction','classiferror');
    end
end
meanloss = mean(lossvals,2);
figure()
plot(lambdavals,meanloss,'ro-')
xlabel('Lambda')
ylabel('Loss (MSE)')
grid on


[~,idx] = min(meanloss)
bestlambda = lambdavals(idx)
bestloss = meanloss(idx)
nca = fscnca(Xtrain,ytrain,'FitMethod','exact','Solver','sgd',...
    'Lambda',bestlambda,'Standardize',true,'Verbose',1);
figure()
plot(nca.FeatureWeights,'ro')
xlabel('Feature index')
ylabel('Feature weight')
grid on

tol    = 0.02;
selidx = find(nca.FeatureWeights > tol*max(1,max(nca.FeatureWeights)))

for i = 1:336
NCAtrain(:,i) = FordATRAIN1(:,selidx(i,1));
end
NCAtrain(:,337) = FordATRAIN1(:,501);


%% fscchi2
X=Xtrain;
Y=ytrain;
[idx,scores] = fscchi2(X,Y);
find(isinf(scores));
bar(scores(idx));
xlabel('Predictor rank');
ylabel('Predictor importance score');
idx(1:100)






X=Xtest;
Y=ytest;
[idx2,scores2] = fscchi2(X,Y);
find(isinf(scores2));
bar(scores2(idx2));
xlabel('Predictor rank');
ylabel('Predictor importance score');
idx2(1:100)
%% fscmrmr
X=Xtrain;
Y=ytrain;

[idx,scores] = fscmrmr(X,Y);
bar(scores(idx))
xlabel('Predictor rank')
ylabel('Predictor importance score')
idx(1:5)

%% 연습
test = array2table(FordATRAINcategory1);
test.Class = abnormaly;

mdl = fscnca(FordATRAINcategory,Class11)

mdl = fscnca(Xtrain,ytrain)
figure()
plot(mdl.FeatureWeights,'ro')
grid on
xlabel('Feature index')
ylabel('Feature weight')

nca = fscnca(FordATRAINcategory,abnormaly,'FitMethod','exact','Solver','minibatch-lbfgs',...
    'Lambda',bestlambda,'Standardize',true,'Verbose',1);



tol    = 0.15;
selidx1 = find(mdl.FeatureWeights > tol*max(1,max(mdl.FeatureWeights)))


features = FordATRAINcategory1(:,selidx1)

newtrain = array2table(features);
newtrain.Class = abnormaly;