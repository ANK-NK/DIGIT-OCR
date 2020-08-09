function [col_img, final_display] = dispdisyData(X, example_width)

%example data width to be automatically set up if not passed
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2)));
end

colormap(gray);%gray scale image

[initial_size n] = size(X);%to compute rows and columns
example_height = (n / example_width);

display_rows = floor(sqrt(initial_size));%no. of display items
display_cols = ceil(initial_size / display_rows);

padding= 1;%padding between images

final_display = - ones(padding+ display_rows * (example_height + padding), ...
                       padding + display_cols * (example_width + padding));
 
                       
%copying every example into a single array to display
current_example = 1;

%to copy the 
for j = 1:display_rows
	for i = 1:display_cols
		if current_example > initial_size, 
			break; 
		end
		% Copy the patch
		
		% to find the max value in the array
		max_val = max(abs(X(current_example, :)));
		final_display(padding + (j - 1) * (example_height + padding) + (1:example_height), ...
		              padding + (i - 1) * (example_width + padding) + (1:example_width)) = ...
						reshape(X(current_example, :), example_height, example_width) / max_val;
		current_example = current_example + 1;
	end
	if current_example > initial_size, 
		break; 
	end
end

%display the example image without axis details
col_img = imagesc(final_display, [-1 1]);%imagesc is to Display a scaled version of the matrix img as a color image.
axis image off
%to update figure windows and their children
drawnow;

end
