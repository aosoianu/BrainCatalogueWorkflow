function [Area] = tri_area(faces,verts);
%TRI_AREA - Find areas of all triangles
% function [Area] = tri_area(faces,verts);
% faces is poly x number of poly (e.g. 1000 x 3);
% verts is number of verts x 3
% Returns Area of each triangle, which can be used in subsequent calls
%
% See also TESSELLATION_STATS

%<autobegin> ---------------------- 27-Jun-2005 10:46:01 -----------------------
% ------ Automatically Generated Comments Block Using AUTO_COMMENTS_PRE7 -------
%
% CATEGORY: Utility - Numeric
%
% Subfunctions in this file, in order of occurrence in file:
%   c = cross(a,b);
%
% At Check-in: $Author: mosher $  $Revision: 20 $  $Date: 2006-02-10 18:03:10 -0800 (Fri, 10 Feb 2006) $
%
% This software is part of BrainStorm Toolbox Version 27-June-2005  
% 
% Principal Investigators and Developers:
% ** Richard M. Leahy, PhD, Signal & Image Processing Institute,
%    University of Southern California, Los Angeles, CA
% ** John C. Mosher, PhD, Biophysics Group,
%    Los Alamos National Laboratory, Los Alamos, NM
% ** Sylvain Baillet, PhD, Cognitive Neuroscience & Brain Imaging Laboratory,
%    CNRS, Hopital de la Salpetriere, Paris, France
% 
% See BrainStorm website at http://neuroimage.usc.edu for further information.
% 
% Copyright (c) 2005 BrainStorm by the University of Southern California
% This software distributed  under the terms of the GNU General Public License
% as published by the Free Software Foundation. Further details on the GPL
% license can be found at http://www.gnu.org/copyleft/gpl.html .
% 
% FOR RESEARCH PURPOSES ONLY. THE SOFTWARE IS PROVIDED "AS IS," AND THE
% UNIVERSITY OF SOUTHERN CALIFORNIA AND ITS COLLABORATORS DO NOT MAKE ANY
% WARRANTY, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, NOR DO THEY ASSUME ANY
% LIABILITY OR RESPONSIBILITY FOR THE USE OF THIS SOFTWARE.
%<autoend> ------------------------ 27-Jun-2005 10:46:01 -----------------------

% ----------------------------- Script History ---------------------------------
% JCM 19-May-2004  Updating comments
% ----------------------------- Script History ---------------------------------

% calculate the areas on all triangles
r12 = verts(faces(:,1),:); % temporary holding
r13 = verts(faces(:,3),:) - r12; % negative of r31
r12 = verts(faces(:,2),:) - r12;			% from 1 to 2
  
Area = sqrt(sum(cross(r12',r13').^2,1))/2;  % area of each triangle

return

function c = cross(a,b);
c = [a(2,:).*b(3,:)-a(3,:).*b(2,:)
  a(3,:).*b(1,:)-a(1,:).*b(3,:)
  a(1,:).*b(2,:)-a(2,:).*b(1,:)];
return
