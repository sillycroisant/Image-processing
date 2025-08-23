function [cdf] = cumilative_density(img)
    img = im2gray(img);
    imin = min(img(:));
    imax = max(img(:));

    [h, w] = size(img);
    n = h * w;

    freq = zeros(imax-imin+1,1);

    for i=1:h
        for j=1:w
            freq(img(i,j)-imin+1) = freq(img(i,j)-imin+1) + 1;
        end
    end

    prob = freq / n;
    cdf = zeros(size(prob));
    cdf(1) = prob(1);

    for i=2:(imax-imin+1)
        cdf(i) = cdf(i-1) + prob(i);
    end

end
