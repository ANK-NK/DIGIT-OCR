function result = prediction_of_output(Theta1, Theta2, X)
  initial_size = size(X, 1);
  num_labels = size(Theta2, 1);
  result = zeros(size(X, 1), 1);
  X = [ones(initial_size, 1) X];
  for j=1:initial_size,
    z2 = sigmoid(X(j,:) * Theta1');
  	z2 = [1 z2];
  	[trash,result(j)] = max(sigmoid(z2 * Theta2'));

end;
end;
