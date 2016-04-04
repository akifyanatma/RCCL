function [resultIm]=search(LB, label, R, C, RMax, CMax, neighborsCount,searchCount)
    LB(R,C) = label;
    
    searchCount = searchCount + 1;
    disp(searchCount);
    if neighborsCount == 4 % 4 komsuluk icin
        for i=0:3
            
            if i==0 %top
                if ((R-1) ~= 0) && LB(R-1, C) == -1 
                    LB = search(LB, label, R-1, C, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==1 %right
                if ((C+1) ~= (CMax+1)) && LB(R, C+1) == -1 
                    LB = search(LB, label, R, C+1, RMax, CMax, neighborsCount,searchCount);
                end
            end 
            
            if i==2 %down
                if ((R+1) ~= (RMax+1)) && LB(R+1, C) == -1
                    LB = search(LB, label, R+1, C, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==3 %left
                if  ((C-1) ~= 0) && LB(R, C-1) == -1
                    LB = search(LB, label, R, C-1, RMax, CMax, neighborsCount,searchCount);
                end
            end 
            
        end
        
    end
    
    if neighborsCount == 8    % 8 komsuluk icin
        for i=0:7
            
            if i==0 %top
                if ((R-1) ~= 0) && LB(R-1, C) == -1 
                    LB = search(LB, label, R-1, C, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==1 %top-right
                if ((R-1) ~= 0) && ((C+1) ~= (CMax+1)) && LB(R-1, C+1) == -1 
                    LB = search(LB, label, R-1, C+1, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==2 %right
                if ((C+1) ~= (CMax+1)) && LB(R, C+1) == -1 
                    LB = search(LB, label, R, C+1, RMax, CMax, neighborsCount,searchCount);
                end
            end 
            
            if i==3 %right-down
                if ((R+1) ~= (RMax+1)) && ((C+1) ~= (CMax+1)) && LB(R+1, C+1) == -1 
                    LB = search(LB, label, R+1, C+1, RMax, CMax, neighborsCount,searchCount);
                end
            end 
            
            if i==4 %down
                if ((R+1) ~= (RMax+1)) && LB(R+1, C) == -1
                    LB = search(LB, label, R+1, C, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==5 %left-down
                if ((R+1) ~= (RMax+1)) && ((C-1) ~= 0) && LB(R+1, C-1) == -1
                    LB = search(LB, label, R+1, C-1, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==6 %left
                if  ((C-1) ~= 0) && LB(R, C-1) == -1
                    LB = search(LB, label, R, C-1, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            if i==7 %left-top
                if  ((R-1) ~= 0) && ((C-1) ~= 0)  && LB(R-1, C-1) == -1
                    LB = search(LB, label, R-1, C-1, RMax, CMax, neighborsCount,searchCount);
                end
            end
            
            
            
        end
    end
    
    resultIm = LB;
end

