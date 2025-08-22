function q_img = quantize(img, bit)
    q_img = (img / 2^(8-bit)) * 2^(8-bit);
end

