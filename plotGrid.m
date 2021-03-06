function _return = plotGrid(xmin,xmax, ymin, ymax, e1, e2, nbRepetE1, nbRepetE2, color, linewidth)
	
%plotting the destination basis vectors
	for i = -nbRepetE1:nbRepetE1
		startX = i * e2(1); 
		startY = i* e2(2);
		endX = e1(1); 
		endY = e1(2); 
		drawLine([startX startY endX endY], 'color', color, 'linewidth', linewidth);
	endfor

	for i = -nbRepetE2:nbRepetE2
		startX = i * e1(1); 
		startY = i* e1(2);
		endX = e2(1); 
		endY = e2(2); 
		drawLine([startX startY endX endY], 'color', color, 'linewidth', linewidth);
	endfor

endfunction
