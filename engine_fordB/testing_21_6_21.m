
subplot(2,1,1)
ylim([-6 6])
hold on
for i = 1:100
    plot(FordBTRAIN_double(i,2:501));
end
subplot(2,1,2)
ylim([-6 6])
hold on
for i = 1: 100
    plot(FordBTEST_double(i,2:501));
end

%%



x=1:1:810;
index1 = find(FordBTRAIN_double(1:810,1) == 1)
index2 = find(FordBTEST_double(:,1) == 1)




for i = 1:100
    subplot(2,1,1)
    ylim([-6 6 ])

    plot(x,FordBTRAIN_double(1:810,i+1),'-o','MarkerIndices',index1')
    subplot(2,1,2)
    ylim([-6 6 ])

    plot(x,FordBTEST_double(:,i+1),'-o','MarkerIndices',index2')
    pause(1)
end




a = [1 2 3;4 5 6];
mean(a);

train_abnormal = FordBTRAIN_double(1:1860,2:501);
train_normal = FordBTRAIN_double(1861:3636,2:501);
train_abnormal2 = FordATRAIN1(1:1846,2:501);
train_normal2 = FordATRAIN1(1847:3601,2:501);

mean_ab = mean(train_abnormal);
mean_no = mean(train_normal);
mean_ab2 = mean(train_abnormal2);
mean_no2 = mean(train_normal2);


subplot(2,1,1)

plot(mean_ab)
hold on
plot(mean_ab2)
ylim([-0.1,0.1])
subplot(2,1,2)

plot(mean_no)
hold on
plot(mean_no2)
ylim([-0.1,0.1])

sub = mean_no - mean_ab;
sub2= mean_no2 - mean_ab2;

x=1:500;
subplot(2,1,1)
scatter(x,sub)

ylim ([-0.15 0.15])
subplot(2,1,2)
scatter(x,sub2)
ylim ([-0.15 0.15])