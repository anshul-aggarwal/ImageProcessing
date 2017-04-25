i = imread('img.png');
i = rgb2gray(i);

fl = fopen('image.rlc', 'w');

[r,c] = size(i);
fwrite(fl, r, 'uint16');
fwrite(fl, ' ');
fwrite(fl, c, 'uint16');
fwrite(fl, ',');

for m = 1:r
    ctr = 1;
    px = i(m,1);
    for n = 2:c
        if i(m,n) == px
            ctr = ctr + 1;
        else
            fwrite(fl, px, 'uint16');
            fwrite(fl, ' ');
            fwrite(fl, ctr, 'uint16');
            fwrite(fl, ',');
            %fprintf('px = %s ctr = %s\n',num2str(px),num2str(ctr))
            ctr = 1;
            px = i(m,n);
        end
        if n == c
            fwrite(fl, px, 'uint16');
            fwrite(fl, ' ');
            fwrite(fl, ctr, 'uint16');
            fwrite(fl, ',');
            %fprintf('px = %s ctr = %s\n',num2str(px),num2str(ctr))
        end
    end
end

fclose(fl);
