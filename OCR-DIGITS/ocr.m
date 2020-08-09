fprintf("Digits Recogonition Using Neural Network\n")
 
%data set used from http://yann.lecun.com/exdb/mnist/
%NOTE: SOME ARE ARTIFICIALLY CREATED DATA NOT PRESENT IN MNIST DATASET

fprintf('\nLoad the value and visualize it for reference....\n')
%to load the training dataset 
load('dataset.mat');
%initialize the size of the dataset
initial_size = size(X, 1);

%randomly permute the datasets available
random_selected = randperm(size(X, 1));
%display 150 randomly permutaed images form the dataset
random_selected = random_selected(1:156);
%to know the data randomly permuted display it...
data_disp(X(random_selected , :));

fprintf('\nPause 1 Data Displaying..hit enter key\n')
pause;

fprintf('\nNeural Network parameters(ex:weights)\n')
load('labels.mat');
predicted_digit = prediction_of_output(Theta1, Theta2, X);
acc=mean(double(predicted_digit == y)) * 100;
fprintf('\nTraining Set Accuracy: %f%%\n', acc);

fprintf('Pause 2..hit enter key\n');
pause;

random_permuted = randperm(initial_size);

for i = 1:initial_size
    
    fprintf('\nExample Image\n');
    data_disp(X(random_permuted(i), :));

    predicted_digit = prediction_of_output(Theta1, Theta2, X(random_permuted(i),:));
    fprintf('\nNeural Network Predicted : %d (digit %d)\n', predicted_digit, mod(predicted_digit, 10));
    fprintf("Pause %d ",(i+2));
    s = input('press y to continue  [ or q to exit:]','s');
    if s == 'q'
      fprintf("Thank You!!! BY ANK \n");
      break
    end
end
