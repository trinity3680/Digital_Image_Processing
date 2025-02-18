function shannon_fano_coding()
    % Define the ranges and their corresponding frequencies
    ranges = [1 30; 31 59; 60 63; 64 100; 101 130; 131 159; 160 200; 201 255];
    frequencies = [2048, 2048, 2048, 2048, 819, 819, 3277, 3277];
    
    % Normalize probabilities
    probabilities = frequencies / sum(frequencies);
    
    % Sort in descending order
    [probabilities, idx] = sort(probabilities, 'descend');
    ranges = ranges(idx, :);
    
    % Generate Shannon-Fano codes
    codes = cell(1, length(probabilities));
    codes = shannon_fano_recursive(probabilities, codes, '');
    
    % Display the Shannon-Fano codes
    for i = 1:length(codes)
        fprintf('Range: %d-%d, Code: %s\n', ranges(i, 1), ranges(i, 2), codes{i});
    end
end

function codes = shannon_fano_recursive(probabilities, codes, prefix)
    % Base case: if only one probability remains, assign the prefix
    if length(probabilities) == 1
        codes{1} = prefix;
        return;
    end
    
    % Find the partition index
    total_sum = sum(probabilities);
    cumulative_sum = cumsum(probabilities);
    split_index = find(cumulative_sum >= total_sum / 2, 1);
    
    % Split into two groups
    left_probs = probabilities(1:split_index);
    right_probs = probabilities(split_index+1:end);
    
    % Assign binary values and recurse
    codes(1:split_index) = shannon_fano_recursive(left_probs, codes(1:split_index), strcat(prefix, '0'));
    codes(split_index+1:end) = shannon_fano_recursive(right_probs, codes(split_index+1:end), strcat(prefix, '1'));
    
    return;
end

