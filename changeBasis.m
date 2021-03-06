clear all;
close all;
pkg load geometry;

xmin = -2;
xmax = 8;
ymin = -2;
ymax = 4;

arrowHeadSize = 0.3;

%canonical base
ecan1 = [1 ; 0];
ecan2 = [0 ; 1];

%origin base
e1 = [1 ; 0];
e2 = [0 ; 1];

%destination base
e1_ = [3 ; 1];
e2_ = [-2 ; 1];

hold on;
axis([xmin xmax ymin ymax]);

%plots the grids
plotGrid(xmin,xmax, ymin, ymax, e1, e2, 9, 9, 'g', 1);
plotGrid(xmin,xmax, ymin, ymax, e1_, e2_, 5, 4, 'r', 1);
plotGrid(xmin,xmax, ymin, ymax, ecan1, ecan2, 0, 0, 'black', 2);

%arrows for all the different basis
eH = drawArrow([zeros(2,2), [e1'; e2']],arrowHeadSize, arrowHeadSize);
eH_ = drawArrow([zeros(2,2), [e1_'; e2_']],arrowHeadSize, arrowHeadSize);

%coloring the arrows
arrayfun(@(x,y)set(x,'color',y), [eH.body; eH.wing(:)],repmat(['ggg']',2,1));
arrayfun(@(x,y)set(x,'color',y), [eH_.body; eH_.wing(:)],repmat(['rrr']',2,1));

%make the arrows bold
lineWidth = 3;
arrayfun(@(x,y)set(x,'linewidth',y), [eH.body; eH.wing(:)],repmat([lineWidth lineWidth lineWidth]',2,1));
arrayfun(@(x,y)set(x,'linewidth',y), [eH_.body; eH_.wing(:)],repmat([lineWidth lineWidth lineWidth]',2,1));

%plotting coordinates => specific slides
%eH1 = drawArrow([[e1_'], [(2*e1_)']],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [eH1.body; eH1.wing(:)],repmat(['rrr']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [eH1.body; eH1.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

%plots the points
v1 = [4 3];
lineWidth = 2;
ev1 = drawArrow([zeros(1,2), v1],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [ev1.body; ev1.wing(:)],repmat(['kkk' ]',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [ev1.body; ev1.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

%v2 = [4, 3];
%plot(v2(1),v2(2), "bo", "linewidth", 2);

%plotting projections/components
%e1 on e1_
%plotComponent(e1, e2_, e1_, ":", 2, [0.5 0.5 0.5]);
%e1 on e2_
%plotComponent(e1, -e1_, -e2_, ":", 2, [0.5 0.5 0.5]);
%e2 on e1_
%plotComponent(e2, -e2_, e1_, ":", 2, [0.5 0.5 0.5]);
%e2 on e2_
%plotComponent(e2, -e1_, e2_, ":", 2, [0.5 0.5 0.5]);

%components of origin basis vector in destination basis
x11 = intersectLines(createLine(e1(1), e1(2), e2_(1), e2_(2)), createLine(0, 0, e1_(1), e1_(2)));
x21 = intersectLines(createLine(e1(1), e1(2), -e1_(1), -e1_(2)), createLine(0, 0, -e2_(1), -e2_(2)));
x12 = intersectLines(createLine(e2(1), e2(2), -e2_(1), -e2_(2)), createLine(0, 0, e1_(1), e1_(2)));
x22 = intersectLines(createLine(e2(1), e2(2), -e1_(1), -e1_(2)), createLine(0, 0, e2_(1), e2_(2)));

%example n°9 : coordinates of v from origin basis to destination basis
%v11 = drawArrow([zeros(1,2), 4*x11],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v11.body; v11.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v11.body; v11.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v21 = drawArrow([4*x11, 4*x11+4*x21],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v21.body; v21.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v21.body; v21.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v12 = drawArrow([4*x11+4*x21, 4*x11+4*x21+3*x12],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v22 = drawArrow([4*x11+4*x21+3*x12, 4*x11+4*x21+3*x12 + 3*x22],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v22.body; v22.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v22.body; v22.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

%example n°10 : coordinates of v from origin basis to destination basis - FACTORED VERSION
%v11 = drawArrow([zeros(1,2), 4*x11],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v11.body; v11.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v11.body; v11.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v12 = drawArrow([4*x11, 4*x11+3*x12],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v21 = drawArrow([4*x11+3*x12, 4*x11+3*x12+4*x21],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v21.body; v21.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v21.body; v21.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%v22 = drawArrow([4*x11+3*x12+4*x21+0.04, 4*x11+3*x12+4*x21 + 3*x22+0.04],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v22.body; v22.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v22.body; v22.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

%example n°11 - 12
%plotComponent(e1, e2_, e1_, ":", 2, [0.5 0.5 0.5]);
%v11 = drawArrow([zeros(1,2), x11],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v11.body; v11.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v11.body; v11.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%plotComponent(e1, -e1_, -e2_, ":", 2, [0.5 0.5 0.5]);
%v21 = drawArrow([zeros(1,2), x21],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v21.body; v21.wing(:)],repmat(['bbb']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v21.body; v21.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%plotComponent(e2, -e2_, e1_, ":", 2, [0.5 0.5 0.5]);
%v12 = drawArrow([zeros(1,2), x12],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%plotComponent(e2, -e1_, e2_, ":", 2, [0.5 0.5 0.5]);
%v22 = drawArrow([zeros(1,2), x22],arrowHeadSize, arrowHeadSize);
%arrayfun(@(x,y)set(x,'color',y), [v22.body; v22.wing(:)],repmat(['mmm']',1,1));
%arrayfun(@(x,y)set(x,'linewidth',y), [v22.body; v22.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

%example n°9 (refactored) et n°13
%4 * x11
v11 = drawArrow([zeros(1,2), x11],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v11.body; v11.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v11.body; v11.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v112 = drawArrow([x11, 2*x11],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v112.body; v112.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v112.body; v112.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v113 = drawArrow([2*x11, 3*x11],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v113.body; v113.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v113.body; v113.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v114 = drawArrow([3*x11, 4*x11],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v114.body; v114.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v114.body; v114.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%4 * x21
v211 = drawArrow([4*x11, 4*x11 + x21],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v211.body; v211.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v211.body; v211.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v211 = drawArrow([4*x11 + x21, 4*x11 + 2*x21],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v211.body; v211.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v211.body; v211.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v211 = drawArrow([4*x11 + 2*x21, 4*x11 + 3*x21],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v211.body; v211.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v211.body; v211.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v211 = drawArrow([4*x11 + 3*x21, 4*x11 + 4*x21],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v211.body; v211.wing(:)],repmat(['bbb']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v211.body; v211.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%3 * x12
v12 = drawArrow([4*x11 + 4*x21, 4*x11 + 4*x21 + x12],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v12 = drawArrow([4*x11 + 4*x21 + x12, 4*x11 + 4*x21 + 2*x12],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v12 = drawArrow([4*x11 + 4*x21 + 2*x12, 4*x11 + 4*x21 + 3*x12],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
%3 * x22
v12 = drawArrow([4*x11 + 4*x21 + 3*x12, 4*x11 + 4*x21 + 3*x12 + x22],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v12 = drawArrow([4*x11 + 4*x21 + 3*x12 + x22, 4*x11 + 4*x21 + 3*x12 + 2*x22],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));
v12 = drawArrow([4*x11 + 4*x21 + 3*x12 + 2*x22, 4*x11 + 4*x21 + 3*x12 + 3*x22],arrowHeadSize, arrowHeadSize);
arrayfun(@(x,y)set(x,'color',y), [v12.body; v12.wing(:)],repmat(['mmm']',1,1));
arrayfun(@(x,y)set(x,'linewidth',y), [v12.body; v12.wing(:)],repmat([lineWidth lineWidth lineWidth]',1,1));

saveas (1, "/media/joseph/5793-02B3/backup/TODOリスト/５＿プロジェクトリスト。プロジェクト参考情報/主成分分析/トランク/英語版/数学的/基準変換/例証/figure14.png");

