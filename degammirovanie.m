function [ dec_im ] =degammirovanie( vostanov_r,gamma,H,W )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
bin_im_red_dec=de2bi(vostanov_r);
% bin_im_g_dec=de2bi(vostanov_g);
% bin_im_b_dec=de2bi(vostanov_b);

Im_dec_red=xor(bin_im_red_dec(:,:),gamma(:,:));
% Im_dec_g=xor(bin_im_g_dec(:,:),gamma(:,:));
% Im_dec_b=xor(bin_im_b_dec(:,:),gamma(:,:));


vostanov_r_dec=zeros(H,W);
% vostanov_g_dec=zeros(H,W);
% vostanov_b_dec=zeros(H,W);
l=1;
for i=1:1:W
    for j=1:1:H
        vostanov_r_dec(j,i)=bi2de(Im_dec_red(l,:));
%         vostanov_g_dec(j,i)=bi2de(Im_dec_g(l,:));
%         vostanov_b_dec(j,i)=bi2de(Im_dec_b(l,:));
        l=l+1;
    end
end





dec_im(:,:,1)=vostanov_r_dec;
% dec_im(:,:,2)=vostanov_g_dec;
% dec_im(:,:,3)=vostanov_b_dec;

end

