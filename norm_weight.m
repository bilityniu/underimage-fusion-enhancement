function [nw1, nw2] = norm_weight(w1, w2, w3, w4, w5, w6)
K = 2;
delta = 0.1;

nw1 = w1 + w2 + w3;
nw2 = w4 + w5 + w6;
w = nw1 + nw2;

nw1 = (nw1 + delta) ./ (w + K * delta);
nw2 = (nw2 + delta) ./ (w + K * delta);
end

