# Deep-Learning-Based Fault Diagnosis: Vehicle Engine and Electric Motor (MATLAB)

MATLAB research scripts by Do-Gyeong Yuk for two fault-diagnosis studies.
The first classifies normal versus abnormal vehicle-engine condition from the FordA / FordB sensor data by converting each 500-value sample into a grayscale or RGB image and applying CNNs, transfer learning with pretrained networks, and autoencoders.
The second converts vibration recordings of a public electric-motor fault dataset into STFT spectrogram images and classifies them by fault type with pretrained networks (transfer learning).

## Publications

- D.-G. Yuk, J. W. Sohn, "Vehicle Engine Anomaly Detection Using Data from Surrounding Sensors," Trans. Korean Soc. Noise Vib. Eng., 32(5), 488–494, 2022. https://doi.org/10.5050/ksnve.2022.32.5.488
- D.-G. Yuk, D. Ryu, J. W. Sohn, "Classification of Normal/Abnormal Conditions for Vehicle Engine," PHMAP 2021 (Best Student Award, Silver Medal).
- Conference presentations on electric-motor fault detection: KSME / KSNVE 2022, PHM Korea 2023, PHM Korea 2025.

## Figures

<p align="center">
  <img src="docs/signal_to_image.png" alt="Signal-to-image conversion" width="560" />
  <br>
  <sub>Signal-to-image conversion for the engine data: each 500-value sample becomes a 1 x 500 grayscale or RGB image, which is resized for the CNNs (images from the PHMAP 2021 slides).</sub>
</p>

<p align="center">
  <img src="docs/autoencoder_mse.png" alt="Autoencoder reconstruction error" width="680" />
  <br>
  <sub>Autoencoder reconstruction error (MSE) at five hidden-layer sizes (5, 10, 15, 20, 25 nodes) for grayscale (left) and RGB (right) images, from the PHMAP 2021 slides. Bars follow the order of the slide table: normal training data, normal and abnormal test data, normal and abnormal noisy test data, and the same noisy test data after denoising.</sub>
</p>

<p align="center">
  <img src="docs/motor_time_frequency.png" alt="Raw signal, FFT, STFT and wavelet images of motor vibration samples" width="760" />
  <br>
  <sub>Raw signal, FFT spectrum, STFT image and wavelet-transform (WT) image of one normal and one fault vibration sample of the motor dataset (from the November 2022 KSME slides).</sub>
</p>

<p align="center">
  <img src="docs/motor_features.png" alt="Time-domain and frequency-domain features" width="760" />
  <br>
  <sub>Time-domain and frequency-domain features extracted from each motor vibration sample for the feature-based classifiers (diagram from the KSME 2022 poster and the KSNVE 2022 slides).</sub>
</p>

<p align="center">
  <img src="docs/motor_feature_vectors.png" alt="Feature vectors and class counts" width="680" />
  <br>
  <sub>Feature vectors and class counts of the two motor classification settings, by condition only and by rated power and condition (from the November 2022 KSME slides).</sub>
</p>

<p align="center">
  <img src="docs/motor_nca_weights.png" alt="NCA feature weights" width="420" />
  <br>
  <sub>Feature weights from neighborhood component analysis (NCA) plotted over the feature index, with the features selected in the slides circled in red (from the November 2022 KSME slides).</sub>
</p>

<p align="center">
  <img src="docs/motor_classifier_layers.png" alt="Layer sequences of the LSTM and CNN classifiers" width="760" />
  <br>
  <sub>Layer sequences of the LSTM classifier (left) and of the CNN image classifier (right) as drawn in the KSNVE 2022 and November 2022 KSME slides.</sub>
</p>

## Repository structure

| Path | Purpose |
|---|---|
| `engine_phmap2021/gray_rgb_matrix_generate_code.m` | Builds grayscale and RGB image cell arrays for the FordA training set, the FordA test set and the FordB test set. |
| `engine_phmap2021/savefigure_and_matrix_generate_code.m` | Same conversion, and writes every image to a PNG file per split and class, including the denoised FordB test set. |
| `engine_phmap2021/resizing_code.m` | Resizes the PNG files to 224×224 and 227×227. |
| `engine_phmap2021/denoising_code.m` | Wavelet denoising of the FordB test matrix. |
| `engine_phmap2021/autoencoder_code.m` | Trains autoencoders on normal-class training images and compares reconstruction MSE across data subsets. |
| `engine_fordA/selfcnncode.m` | Custom CNN for 224×224×3 images (training and test). |
| `engine_fordA/transferlearningcode.m` | Transfer learning with pretrained networks (the saved paths point to FordB images). |
| `engine_fordA/image_maker.m` | Converts each sample into a 20×25 grayscale and RGB image. |
| `engine_fordA/new_image_maker.m` | Writes the 20×25 images to PNG files. |
| `engine_fordA/CNN_date_21_4_5.m` | Small CNN for 20×25×1 grayscale images. |
| `engine_fordA/CNN_date_22_6_27.m` | Small CNN for 20×25×3 RGB images. |
| `engine_fordA/autoencoder/autoencoder.m` | Autoencoder experiments on raw 500-value vectors and on 20×25 images (FordA and FordB). |
| `engine_fordA/pca_code.m` | PCA of the 500 variables and selection of the components that explain 95 % of the variance. |
| `engine_fordA/FeatureSelectionCode.m` | Feature ranking with neighborhood component analysis, chi-square tests and MRMR. |
| `engine_fordA/CAM Function/Untitled2.m` | Class activation map of a pretrained SqueezeNet for one FordA image. |
| `engine_fordB/testing_21_6_21.m` | Plots FordB samples and compares per-class mean curves of FordA and FordB. |
| `engine_fordB/wavelet_code.m` | Wavelet denoising of FordB data with plots and audio playback of the signals. |
| `engine_fordB/autoencoder/Untitled3.m` | Grayscale image conversion of FordB and autoencoder hidden-size sweep. |
| `engine_fordB/autoencoder/rgb_code.m` | RGB image conversion of FordB and autoencoder hidden-size sweep. |
| `motor_stft/stft_data_maker.m` | Generates STFT spectrogram PNG files per fault class from motor vibration CSV files. |
| `motor_stft/training_filepath.xlsx` | Table of rated power, machine ID, fault label and dataset folder for the training split, in the column layout that `stft_data_maker.m` indexes. |
| `motor_stft/validation_filepath.xlsx` | Same table for the validation split. |
| `motor_transfer_learning/transferlearning_code_motor.m` | Transfer learning with AlexNet and ShuffleNet on the STFT image folders, by fault class and by rated power and fault class, each followed by a test on a separate image folder. |
| `archive/CNN.m` | Earlier CNN for 28×28×1 images (April 2021). |
| `archive/CNN_revised.m` | Later CNN variant with 5×5 convolutions (November 2021). |
| `archive/savefigure.m` | Earlier image-saving script, including PCA-score images and a stacked autoencoder with a softmax layer. |
| `archive/save_figure_code.m` | Earlier version of the PNG export, with a commented-out STFT image export. |
| `docs/` | Figures shown in this README. |

## How it works

### Engine data (FordA / FordB)

- The scripts read numeric matrices from the MATLAB workspace, with the class label in column 1 and the 500 values of one sample in columns 2–501.
- Class blocks are addressed by fixed row ranges, so the matrices must be sorted by class with the abnormal class first (label −1 in the script comments).
- The sorting and the import of the raw files are not part of the scripts.

| Workspace variable | Rows | Abnormal rows | Normal rows | Role in the scripts |
|---|---|---|---|---|
| `FordATRAIN1` | 3601 | 1–1846 | 1847–3601 | training set |
| `FordATEST` | 1320 | 1–681 | 682–1320 | test set (`test1`) |
| `FordBTRAIN_double` | 3636 | 1–1860 | 1861–3636 | FordB training set |
| `FordBTEST_double` | 810 | 1–401 | 402–810 | test set recorded under noisy conditions (`test2`) |

Signal-to-image conversion:

| Script | Conversion | Image |
|---|---|---|
| `engine_phmap2021/savefigure_and_matrix_generate_code.m` | `mat2gray(x, [-6 6])` | 1×500 grayscale |
| `engine_phmap2021/savefigure_and_matrix_generate_code.m` | `mat2im(x, hot(500000), [-6 6])` | 1×500×3 RGB |
| `engine_phmap2021/resizing_code.m` | `imresize` of the saved PNG files | 224×224 and 227×227 |
| `engine_fordA/image_maker.m` | 500 values arranged row-wise as a 20×25 matrix, then `mat2gray` or `mat2im(…, hot(500000))` | 20×25 grayscale, 20×25×3 RGB |
| `archive/savefigure.m` | first 66 PCA scores through `mat2im(…, hot(100))` | 1×66×3 RGB |

Classification networks (all trained with `trainNetwork` on an `imageDatastore` split 80 % / 20 % into training and validation):

| Script | Input | Layers | Training options |
|---|---|---|---|
| `engine_fordA/selfcnncode.m` | 224×224×3 | 5 blocks of 3×3 convolution (8, 16, 16, 32, 32 filters), batch normalization and ReLU, with average pooling after blocks 1–2 and max pooling after blocks 3–4; fully connected 3000, 1500, 300, 50, 2 with dropout; softmax | `sgdm`, learning rate 0.0001, 200 epochs |
| `engine_fordA/CNN_date_21_4_5.m` | 20×25×1 | 4 blocks of 3×3 convolution (4, 8, 16, 32 filters), batch normalization and ReLU, with 2×2 pooling between blocks; global max pooling; fully connected 32, 16, 2 with dropout 0.2; softmax | `adam`, learning rate 0.001, 100 epochs |
| `engine_fordA/CNN_date_22_6_27.m` | 20×25×3 | 3 blocks of 3×3 convolution (2, 4, 8 filters), batch normalization and ReLU, with 2×2 pooling between blocks; fully connected 8, 4, 2 with dropout 0.5; softmax | `sgdm`, learning rate 0.001, 300 epochs |
| `engine_fordA/transferlearningcode.m` | input size of the pretrained network | `alexnet`, `resnet18`, `googlenet`, `squeezenet` or `shufflenet` with the last three layers replaced by a new fully connected layer (learn-rate factor 20), softmax and classification layer | `sgdm`, learning rate 0.0001, 8 epochs, mini-batch 10, random reflection and ±30 pixel translation |
| `archive/CNN.m` | 28×28×1 | 3 blocks of 3×3 convolution (64 filters), batch normalization and ReLU; global average pooling; fully connected 100, 50, 2; softmax | `adam`, learning rate 0.0001, 300 epochs, mini-batch 256 |

Autoencoders (`trainAutoencoder`); the configurations below are trained on normal-class data and then used to reconstruct the other subsets and compare the mean squared error:

| Script | Training input | Hidden sizes | Epochs | Other options set in the script |
|---|---|---|---|---|
| `engine_phmap2021/autoencoder_code.m` | 1×500 grayscale and 1×500×3 RGB images, FordA normal training rows | 5, 10, 15, 20, 25 | 1000 | linear decoder (`purelin`) |
| `engine_fordB/autoencoder/Untitled3.m`, `rgb_code.m` | 1×500 grayscale and 1×500×3 RGB images, FordB normal training rows | 200, 400, 600, 800 | 1500 | linear decoder (`purelin`) |
| `engine_fordA/autoencoder/autoencoder.m` | 20×25 grayscale images, FordA normal training rows | 300 | 3000 | `satlin` encoder, `purelin` decoder, L2 weight regularization 0.01, sparsity regularization 4, sparsity proportion 0.10 |

- In the saved state of `engine_phmap2021/autoencoder_code.m` the RGB loop runs only the first hidden size.
- `engine_phmap2021/denoising_code.m` applies `wdenoise` (level 3, wavelet `db14`, universal threshold, hard rule, level-independent noise estimate) to each of the 500 columns of the FordB test matrix.
- The denoised test set is converted to images with value limits [-4 4] and [-6 6] and evaluated like the other subsets.
- `engine_fordA/pca_code.m` and `engine_fordA/FeatureSelectionCode.m` analyse the 500 variables with `pca`, `fscnca`, `fscchi2` and `fscmrmr`.
- `engine_fordA/CAM Function/Untitled2.m` is based on a MathWorks class activation mapping example and takes a FordA image file as input.

### Motor data

STFT image generation:

- `motor_stft/stft_data_maker.m` expects string arrays `filepath_list` and `filepath_list_validation` in the workspace, with the fault label in column 3 and a folder of CSV files in column 5.
- `motor_stft/training_filepath.xlsx` and `motor_stft/validation_filepath.xlsx` hold tables of this layout, with the columns Watt, name, type, file_name and file_path and one row per machine and fault label.
- Each CSV file is read with `tabularTextDatastore`, and the signal column is passed to `stft`.
- The spectrogram figure is saved without axes or colorbar as a PNG file with `export_fig` into one folder per split and class.

| STFT setting in `stft_data_maker.m` | Value |
|---|---|
| Sampling rate passed to `stft` | 4000 Hz |
| Window | periodic Hamming, 1500 samples |
| Overlap | 750 samples |
| FFT length | 12000 |
| Header lines skipped per CSV file | 9 |

| Label in the dataset | Output class | Meaning |
|---|---|---|
| 정상 | `normal` | normal |
| 축정렬불량 | `E1` | shaft misalignment |
| 회전체불평형 | `E2` | rotor unbalance |
| 베어링불량 | `E3` | bearing fault |
| 벨트느슨함 | `E4` | belt looseness |

Classes by rated power (`perWatt`):

- A second class definition combines a rated-power group with the condition, which gives the class names `W1-Normal` to `W12-E4` listed in the test sections of `engine_fordA/CNN_date_21_4_5.m` and `engine_fordA/CNN_date_22_6_27.m`.
- The same test sections also define the five class names Normal and E1–E4, and the one in `CNN_date_21_4_5.m` points to a `perWatt` STFT image folder.
- The table below pairs the groups with the rated powers in the order of the two spreadsheets; the conditions per group in the spreadsheets and in the class-name list coincide.

| Group | Rated power | Conditions |
|---|---|---|
| W1 | 2.2 kW | Normal, E1, E2, E3, E4 |
| W2 | 3.7 kW | Normal, E1, E2, E3 |
| W3 | 3.75 kW | Normal, E1 |
| W4 | 5.5 kW | Normal, E1, E2, E3, E4 |
| W5 | 7.5 kW | Normal, E1, E3, E4 |
| W6 | 11 kW | Normal, E1, E2, E3, E4 |
| W7 | 15 kW | Normal, E2, E3, E4 |
| W8 | 18.5 kW | Normal, E3, E4 |
| W9 | 22 kW | Normal, E1, E2, E4 |
| W10 | 30 kW | Normal, E1 |
| W11 | 37 kW | Normal, E1 |
| W12 | 55 kW | Normal, E2, E4 |

Transfer learning (`motor_transfer_learning/transferlearning_code_motor.m`):

- Each of the four sections loads a pretrained network, replaces its last fully connected layer and its classification layer, and trains on an image folder that is split 80 % / 20 % into training and validation.
- Each section then classifies a separate test image folder and saves the trained network together with the test accuracy.
- The image folders `stft data set/training` and `stft data set/validation` are the ones that `stft_data_maker.m` writes to.
- An `imageDataAugmenter` is defined in every section but is not passed to the datastores, so the images are only resized to the network input size.
- In the saved state the first section loads ShuffleNet while its title and the replaced layer names (`fc8`, `output`) belong to AlexNet, and its image folders belong to a different image set that is not part of this repository.

| Section | Network loaded | Training / test image folders | Epochs | Validation frequency |
|---|---|---|---|---|
| `alexnet_stft` | `shufflenet` | `Case1` / `Test` of a different image set | 30 | 1 |
| `alexnet_stft_perWatt` | `alexnet` | `stft data set/perWatt/training` / `stft data set/perWatt/validation` | 15 | 3 |
| `shufflenet_stft` | `shufflenet` | `stft data set/training` / `stft data set/validation` | 15 | 3 |
| `shufflenet_stft_perWatt` | `shufflenet` | `stft data set/perWatt/training` / `stft data set/perWatt/validation` | 15 | 3 |

| Training option in all sections | Value |
|---|---|
| Solver | `sgdm` |
| Mini-batch size | 128 |
| Initial learning rate | 0.0001 |
| Shuffle | every epoch |
| Learn-rate factor of the new fully connected layer | 10 |

Classifiers described only in the presentation material:

- The conference slides and posters also describe a two-layer feed-forward network and an LSTM network trained on feature vectors, each with and without feature selection by neighborhood component analysis (NCA), a CNN trained on STFT and wavelet-transform images, and transfer learning with five pretrained networks.
- Of these, this repository contains the STFT image generation and the transfer-learning script for AlexNet and ShuffleNet.
- The scripts for the feature extraction, the NCA, the feed-forward network, the LSTM network, the wavelet-transform images and the CNN were not found.
- The values in the table below are quoted from the slides and cannot be checked against code in this repository.

| Item in the slides | Value |
|---|---|
| Feature vector for classification by condition | 1×18, rated power followed by the features |
| Feature vector for classification by rated power and condition | 1×17 |
| Features marked as selected by NCA (feature index) | Abs Mean (3), Frequency 1x (11), Frequency 2x (12), Frequency 4x (14), Belt 1x (15), Belt 2x (16), Belt 3x (17) |
| Feed-forward network | 100 hidden neurons, scaled conjugate gradient backpropagation |
| CNN | optimizer adam, learning rate 0.0001, input image size 224 |
| Pretrained networks | AlexNet, SqueezeNet, ShuffleNet, GoogLeNet, ResNet-18 |

## Requirements

- All code is MATLAB script code.
- `engine_fordB/wavelet_code.m` carries a header naming MATLAB 9.10 and Wavelet Toolbox 5.6.
- `motor_stft/stft_data_maker.m` uses `Name=Value` argument syntax, which needs MATLAB R2021a or newer.

| Toolbox | Functions used in the scripts |
|---|---|
| Deep Learning Toolbox | `trainNetwork`, `trainingOptions`, layer functions, `layerGraph`, `replaceLayer`, `classify`, `activations`, `augmentedImageDatastore`, `trainAutoencoder`, `trainSoftmaxLayer`, `stack`, `plotconfusion` |
| Pretrained network support packages | `alexnet`, `resnet18`, `googlenet`, `squeezenet`, `shufflenet` |
| Image Processing Toolbox | `mat2gray`, `imclearborder`, `immse` |
| Statistics and Machine Learning Toolbox | `pca`, `fscnca`, `fscchi2`, `fscmrmr`, `cvpartition` |
| Signal Processing Toolbox | `stft`, `hamming` |
| Wavelet Toolbox | `wdenoise` |
| Parallel Computing Toolbox | `'ExecutionEnvironment','parallel'` in `archive/CNN_revised.m` only |

Third-party MATLAB code that the scripts call and that is not included here:

- `mat2im` (MATLAB File Exchange), used for the RGB conversion.
- `export_fig`, used to save figures as PNG files.
- `CAMshow`, `normalizeImage` and `activationLayerName` from the MathWorks class activation mapping example, used by `engine_fordA/CAM Function/Untitled2.m`.

## Running

- The files are scripts that work on variables already present in the MATLAB workspace and on hard-coded Windows folder paths, so the paths have to be edited first.
- The order implied by the variables and folders each engine script uses is: load the class-sorted matrices, `denoising_code.m`, `savefigure_and_matrix_generate_code.m`, `resizing_code.m`, then a training script.
- `resizing_code.m` works inside the per-size folders, where it writes resized `data_<n>.png` files and deletes the `file_*.png` files it read.
- `autoencoder_code.m` needs the image cell arrays created by `savefigure_and_matrix_generate_code.m` in the workspace.
- `new_image_maker.m` needs the cell arrays created by `image_maker.m` in the workspace.
- `stft_data_maker.m` needs `filepath_list` and `filepath_list_validation` in the workspace; importing the two spreadsheets in `motor_stft/` as string arrays is not part of the script.
- `transferlearning_code_motor.m` reads the image folders written by `stft_data_maker.m` and `perWatt` image folders whose generation is not part of the saved scripts.
- Its sections are independent of each other, and each one changes into a results folder before saving a MAT-file with the trained network.
- Its first section passes an output function `stopIfAccuracyNotImproving` to `trainingOptions`; this function is not defined in the script and is not included.

## Data

- No datasets, generated images, MATLAB workspaces or trained networks are included.
- FordA and FordB are public datasets of the Time Series Classification archive (timeseriesclassification.com) and were originally used in a competition at the IEEE World Congress on Computational Intelligence 2008.
- The dataset description states that FordA was collected in typical operating conditions and that the FordB test data were collected under noisy conditions.
- The motor recordings are a third-party dataset that is not redistributed here.
- The folder name in the script, 기계시설물고장예지센서 (machine-facility fault-prediction sensor), matches the title of a public dataset distributed through AI Hub (aihub.or.kr).
- The two spreadsheets in `motor_stft/` contain only rated powers, machine IDs, fault labels and folder paths of that dataset, not recordings.
- The motor dataset is organised as split / sensor type (`current`, `vibration`) / rated power / machine ID / fault label / CSV file.
- Each CSV file starts with 9 header lines (date, file name, label, label number, motor specification, period, sample rate, RMS, data length) followed by rows of time and signal values.

## Notes

- `motor_transfer_learning/transferlearning_code_motor.m` was renamed and a folder name in two of its paths was replaced by `dataset`, because both carried a person's name; no other code was changed.
- This is research code kept as it was used; file dates range from 2021 to 2022.
- The motor scripts and spreadsheets date from May 2022, and the motor figures are taken from presentation material of 2022.
- Several scripts keep leftover lines from interactive use, such as alternative assignments and paths of other experiments, and are not guaranteed to run from top to bottom.
- `engine_fordB/wavelet_code.m` starts from MATLAB-generated code, and `engine_fordA/CAM Function/Untitled2.m` from a MathWorks documentation example.
