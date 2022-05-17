function [IMx,S, Sa] = Clustering(IMx)
IMx_data = reshape(IMx,[],1);
IMx_data = double(IMx_data);
[idx c] = kmeans(IMx_data,3);
IM_idx = reshape(idx,size(IMx));
S = IM_idx;
Sa = S == 3;
Sa = im2double(Sa);

end
    
    


