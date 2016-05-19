function [ima] = load_ima(filename)
%  LOADIMA Import Brainvisa ima into Matlab

fid = fopen(filename,'r');
if fid == -1, error(sprintf('[load_ima] Cannot open %s.',filename)); end
[pathstr, name, format] = fileparts(filename);
if ~ismember(lower(format),{'.ima'})
	error(sprintf('[load_ima] Unknown format %s.',format));
end
file_dim=fullfile(pathstr,[name,'.dim']);
[dim_mat,vox_size,type,file_format]=load_dim(file_dim);
switch file_format
    case 'binar'
        if (isequal(type,'S16') || isequal(type,'U16'))
            mat=fread(fid,dim_mat(1)*dim_mat(2)*dim_mat(3), 'uint16');
        elseif isequal(type,'U8')
            mat=fread(fid,dim_mat(1)*dim_mat(2)*dim_mat(3), 'uint8');
        elseif isequal(type,'FLOAT')
            mat=fread(fid,dim_mat(1)*dim_mat(2)*dim_mat(3), 'float');
        elseif isequal(type,'DOUBLE')
            mat=fread(fid,dim_mat(1)*dim_mat(2)*dim_mat(3), 'double');
        else
            error(sprintf('[load_ima] Unknown type %s.',type));
        end
    case 'ascii'
        fprintf('format non compatible pour l instant!\n');
    otherwise
        error(sprintf('[load_ima] Unknown format %s.',format));
end
ima.type=type;
ima.mat=mat;
ima.dim_mat=dim_mat;
ima.vox_size=vox_size;
fclose(fid); 
if fid == -1, error(sprintf('[load_ima] Cannot close %s.',filename)); end
