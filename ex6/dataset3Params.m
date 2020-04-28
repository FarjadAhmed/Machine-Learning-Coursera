function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

val_array = [0.01 0.03 0.1 0.3 1 3 10 30];
% val_array = [0.01 0.03];
track = zeros(2, (length(val_array))^2);
size(track)
s = 1;

for i = 1:length(val_array)
    
    C = val_array(i);
    
    for a = 1:length(val_array)
        
        
        sigma = val_array(a);
        
        model = svmTrain(X, y, C, @(x1, x2)gaussianKernel(x1, x2, sigma));
        %visualizeBoundary(X, y, model);
        predictions = svmPredict(model, Xval);
%         size(predictions)
        pred_error(:, s) = mean(double(predictions ~= yval));
        track(:, s) = [i;a];
%         size(track)
%         size(pred_error)
%         pred_error(:, s) = predictions;
        s = s+1;
        
    end
end

[M, I] = min(pred_error);
good_params = track(:, I);
% size(good_params);
a1 = good_params(1);
a2 = good_params(2);
% [C sigma] = [val_array(5) val_array(3)];
C = val_array(a1);
sigma = val_array(a2);
% least_error = find(min(pred_error))
% good_params = track(:, least_error)

    
    






% =========================================================================

end
