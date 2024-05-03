use <lib/gears.scad>
$fn=64;
//schnecke(modul, gangzahl, laenge, bohrung, eingriffswinkel=20, steigungswinkel, zusammen_gebaut=true);
whlMntDia = 200;
whlMntT = 5;
whlMntScrwDia = 4.4;
whlMntScrwDiaI = 3.8;

genMntDia = 22.5;
genMntScrwDist = 31;
genMntScrwDia = 3.3;
genMntScrwDiaI = 2.8;

genMntA = 90;
genMntCntDist = 50;
genMntN = 4;
genMntWI = 30;

wheelDia = 140;
wheelT = 8;

brDiaI = 30; //8; //bearing for the axis
brDiaO = 47; // 22.3;
brH=9;

pBrDiaI = 8; //bearing for the pedals
pBrDiaO = 22.3;
pBrH=7;

//axisNutDia=20.1;
axisNutH=7;
axisDia=30; //
axisXY=20;
axisScrwD=5;


//axisExtL = 50;
axisExtLL = 50; //axis extender (to fit motor)
axisExtLR = 15;
axisExtDiaO=brDiaO+6;
axisExtWBtm=22;

pAxisDia=pBrDiaI;

kurbelH = 18;
kurbelL =  whlMntDia/2-axisExtDiaO+45;
echo(kurbelL);
wT = 3;  

//whlMnt(52);
//wheel();
//genGear();
//spacer();

//whlMnt(52);
//wheel();
//genGear();
//spacer();

translate([genMntWI/2+whlMntT+axisExtLL+kurbelH+7,0,whlMntDia/2+kurbelL])pedal();
translate([-(genMntWI/2+whlMntT+axisExtLR+kurbelH+7),0,whlMntDia/2-kurbelL])rotate([0,0,180])pedal();

translate([genMntWI/2+whlMntT,0,0])axisExt(axisExtLL,whlMntScrwDiaI,0);
translate([-genMntWI/2-whlMntT,0,0])rotate([0,0,180])axisExt(axisExtLR,whlMntScrwDiaI,0);

translate([genMntWI/2+whlMntT+axisExtLL+kurbelH+4,0,whlMntDia/2])rotate([180,0,180])kurbel();
translate([-(genMntWI/2+whlMntT+axisExtLR+kurbelH+4),0,whlMntDia/2])rotate([0,0,0])kurbel();

translate([-genMntWI/2-whlMntT,0,whlMntDia/2])rotate([0,-90,180])genPlt(52);
translate([genMntWI/2+whlMntT,0,whlMntDia/2])rotate([0,-90,0])genPlt(52);

translate([-wheelT/2,0,whlMntDia/2])rotate([0,90,0])wheel();

//translate([0,0,whlMntDia-genMntScrwDist/1.4])rotate([0,90,0])genGear();

translate([-genMntWI/2,whlMntDia/2-10,0])edgeMnt(whlMntScrwDiaI,0);
translate([-genMntWI/2,-(whlMntDia/2-10),0])edgeMnt(whlMntScrwDiaI,0);

//translate([-(genMntWI/2+whlMntT+axisExtLR),0,whlMntDia/2])axBrCnn();
//translate([(genMntWI/2+whlMntT+axisExtLL),0,whlMntDia/2])rotate([0,0,180])axBrCnn();
stand();
//axBrCnn();
module stand(){
	hA=8;
	hB=27;
	h=hA+hB;
	
	translate([0,0,-hB]){
		scale([1,1,hB*10]){
			difference(){
				union(){
					translate([genMntWI/2+whlMntT,0,0])axisExt(axisExtLL,whlMntScrwDia,0);
					translate([-genMntWI/2-whlMntT,0,0])rotate([0,0,180])axisExt(axisExtLR,whlMntScrwDia,0);

					translate([-genMntWI/2-whlMntT,0,whlMntDia/2])rotate([0,-90,180])genPlt(52);
					translate([genMntWI/2+whlMntT,0,whlMntDia/2])rotate([0,-90,0])genPlt(52);

					translate([-genMntWI/2,whlMntDia/2-10,0])edgeMnt(whlMntScrwDia,0);
					translate([-genMntWI/2,-(whlMntDia/2-10),0])edgeMnt(whlMntScrwDia,0);
				}
				translate([0,0,500+0.1])cube([1000,1000,1000],center=true);
			}
		}
	}
	translate([0,0,-h]){
		scale([1,1,hA*10]){
			difference(){
				union(){
					translate([genMntWI/2+whlMntT,0,0])axisExt(axisExtLL,whlMntScrwDia,6);
					translate([-genMntWI/2-whlMntT,0,0])rotate([0,0,180])axisExt(axisExtLR,whlMntScrwDia,6);

					translate([-genMntWI/2-whlMntT,0,whlMntDia/2])rotate([0,-90,180])genPlt(52);
					translate([genMntWI/2+whlMntT,0,whlMntDia/2])rotate([0,-90,0])genPlt(52);

					translate([-genMntWI/2,whlMntDia/2-10,0])edgeMnt(whlMntScrwDia,6);
					translate([-genMntWI/2,-(whlMntDia/2-10),0])edgeMnt(whlMntScrwDia,6);
				}
				translate([0,0,500+0.1])cube([1000,1000,1000],center=true);
			}
		}

		translate([0,whlMntDia/2,0])mount(genMntWI+whlMntT*2);
		rotate([0,0,180])translate([0,whlMntDia/2,0])mount(genMntWI+whlMntT*2);
		
		translate([axisExtLL+genMntWI/2+whlMntT-10,axisExtWBtm/2,0])mount(20);
		translate([axisExtLL+genMntWI/2+whlMntT-10,-axisExtWBtm/2,0])rotate([0,0,180])mount(20);
		
		translate([-(axisExtLR+genMntWI/2+whlMntT-axisExtLR/2),axisExtWBtm/2,0])mount(axisExtLR);
		translate([-(axisExtLR+genMntWI/2+whlMntT-axisExtLR/2),-axisExtWBtm/2,0])rotate([0,0,180])mount(axisExtLR);
		
		translate([0,0,0])rcube([genMntWI+whlMntT,axisExtWBtm,hA],0);
		
//		rotate([0,0,180])difference(){
//			hull(){
//				translate([0,whlMntDia/2,0])rcube([genMntWI+whlMntT*2,1,hA],0);
//				translate([0,whlMntDia/2+mntScrD,0])cylinder(h=hA,d=mntScrD*2);
//			}
//			translate([0,whlMntDia/2+mntW,0])cylinder(h=hA,d=mntScrD);
//		}
	}
	module mount(w){
		mntW=10;
		mntScrD=5;
		difference(){
			hull(){
				translate([0,0.5,0])rcube([w,1,hA],0);
				translate([0,mntW,0])cylinder(h=hA,d=mntScrD*3);
			}
			translate([0,mntW,0])cylinder(h=hA,d=mntScrD+0.5);
		}
	}
}


module genPlt(angSrt){ //generator Plate
difference(){
    union(){
			cylinder(d = whlMntDia, h = whlMntT, $fn=64);
			translate([-whlMntDia/2,-whlMntDia/2,])cube([whlMntDia/2,whlMntDia,whlMntT]);
    }
    translate([0,0,0])cylinder(d = brDiaI+10, h = whlMntT+2);
    //translate([0,0,whlMntT/3])cylinder(d = brDiaO, h = whlMntT+2);
    
    for ( i = [0:1:genMntN-1]) {
			hull(){
				rotate([0,0,i*genMntA+angSrt])translate([0,genMntDia/2+genMntCntDist,-1])cylinder(d = genMntDia, h = whlMntT+2);
				rotate([0,0,i*genMntA+angSrt])translate([0,whlMntDia/2-genMntScrwDist/1.4,-1])cylinder(d=genMntDia, h = whlMntT+2);
            }
            hull(){
                rotate([0,0,i*genMntA+angSrt])translate([genMntScrwDist/2,genMntDia/2+genMntCntDist-genMntScrwDist/2,-1])cylinder(d = genMntScrwDia, h = whlMntT+2);
                rotate([0,0,i*genMntA+angSrt])translate([genMntScrwDist/2,whlMntDia/2-genMntScrwDist/1.4+genMntScrwDist/2,-1])cylinder(d=genMntScrwDia, h = whlMntT+2);
            }
            hull(){
                rotate([0,0,i*genMntA+angSrt])translate([-genMntScrwDist/2,genMntDia/2+genMntCntDist-genMntScrwDist/2,-1])cylinder(d = genMntScrwDia, h = whlMntT+2);
                rotate([0,0,i*genMntA+angSrt])translate([-genMntScrwDist/2,whlMntDia/2-genMntScrwDist/1.4+genMntScrwDist/2,-1])cylinder(d=genMntScrwDia, h = whlMntT+2);
            }
        }
        for ( i = [0:1:genMntN-1]) {
            rotate([0,0,i*90+15])translate([0,whlMntDia/2-15,-1])cylinder(d = whlMntScrwDia, h = whlMntT+2);
            rotate([0,0,i*90-15])translate([0,whlMntDia/2-15,-1])cylinder(d = whlMntScrwDia, h = whlMntT+2);
        }
        for ( i = [0:1:2]) {
            translate([-whlMntDia/2+i*30+10,0,-1])cylinder(d = whlMntScrwDia, h = whlMntT+2);
        }
        for ( i = [0:1:1]) {
            translate([-whlMntDia/2+i*20+15,whlMntDia/2-10,-1])cylinder(d = whlMntScrwDia, h = whlMntT+2);
            translate([-whlMntDia/2+i*20+15,-(whlMntDia/2-10),-1])cylinder(d = whlMntScrwDia, h = whlMntT+2);

        }
}
}

module wheel(){
    //stirnrad (modul=2, zahnzahl=60, breite=15, bohrung=8, nabendurchmesser=20, nabendicke=4, eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
    difference(){
			union(){
        stirnrad (modul=1.25, zahnzahl=112, breite=wheelT, bohrung=0, eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
			translate([0,0,wheelT-axisNutH])rcube([axisXY+8,axisXY+8,18],4);
			}
        //cylinder(d = wheelDia, h = wheelT, $fn=64,center=true);
        //translate([0,0,0])cylinder(d = brDiaI-0.6, h = wheelT+2,center=true);
       //translate([0,0,wheelT-axisNutH])cylinder(d = axisNutDia, h = wheelT+2,$fn=6);
			 translate([0,0,wheelT-axisNutH])axis();
			 translate([-50,0,11+wheelT-axisNutH])rotate([0,90,0])cylinder(d=axisScrwD+0.3,h=100);
			 translate([0,50,11+wheelT-axisNutH])rotate([90,90,0])cylinder(d=axisScrwD+0.3,h=100);
        }
}

module axis(){
	translate([0,0,-100])rcube([axisXY+0.2,axisXY+0.2,200],1);
}
module genGear(){
    //stirnrad (modul=2, zahnzahl=60, breite=15, bohrung=8, nabendurchmesser=20, nabendicke=4, eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
    difference(){
        stirnrad (modul=1.25, zahnzahl=10, breite=17, bohrung=5.15, nabendurchmesser=4, nabendicke=5, eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
        //cylinder(d = wheelDia, h = wheelT, $fn=64,center=true);
        //translate([0,0,0])cylinder(d = brDiaI-0.6, h = wheelT+2,center=true);
       //translate([0,0,wheelT-7])cylinder(d = 15.1, h = wheelT+2,$fn=6);
        }
}

module axisExt(length,scrwDia,headsink){
    diaO = axisExtDiaO;
	  wBtm =axisExtWBtm;
    difference(){
        hull(){
            translate([0,0,whlMntDia/2])rotate([0,90,0])cylinder(d = diaO, h = length );
            translate([0,-wBtm/2,0])cube([length,wBtm,1]);
        }
        translate([-1,0,whlMntDia/2])rotate([0,90,0])cylinder(d = brDiaI+6, h = length+2 );
        translate([length-brH,0,whlMntDia/2])rotate([0,90,0])cylinder(d = brDiaO, h = length+2 );
        for ( i = [0:1:2]) {
            translate([-5,0,i*30+10])rotate([0,90,0])cylinder(d = scrwDia, h = length);
        }
        if(length>=20){
            translate([length/5,wBtm/2-6,-1])cylinder(d = scrwDia, h = 60 );
            translate([length*4/5,wBtm/2-6,-1])cylinder(d = scrwDia, h = 60 );
            translate([length/5,-wBtm/2+6,-1])cylinder(d = scrwDia, h = 60 );
            translate([length*4/5,-wBtm/2+6,-1])cylinder(d = scrwDia, h = 60 );
						
						translate([length/5,wBtm/2-6,-1])cylinder(d = scrwDia*2, h = headsink );
            translate([length*4/5,wBtm/2-6,-1])cylinder(d = scrwDia*2, h = headsink );
            translate([length/5,-wBtm/2+6,-1])cylinder(d = scrwDia*2, h = headsink );
            translate([length*4/5,-wBtm/2+6,-1])cylinder(d = scrwDia*2, h = headsink );
        }
        if(length<20){
            translate([length/2,wBtm/2-6,-1])cylinder(d = scrwDia, h = 60 );
            translate([length/2,-wBtm/2+6,-1])cylinder(d = scrwDia, h = 60 );
						translate([length/2,wBtm/2-6,-1])cylinder(d = scrwDia*2, h = headsink );
            translate([length/2,-wBtm/2+6,-1])cylinder(d = scrwDia*2, h = headsink );
        }
    }
}

module axBrCnn(){ //axis bearing connector
	hA=12;
	rotate([0,90,0])difference(){
		union(){
			translate([0,0,0])cylinder(h=brH-0.6, d=brDiaI);
			translate([0,0,-hA])cylinder(h=hA, d=brDiaI+6);
			
			//translate([0,0,-10])cylinder(h=10, d=brDiaI-0.2,$fn=4);
		}
		//translate([0,0,-hA])difference(){
		//	rcube([axisXY*2,axisXY*2,hA],3);
		//	rcube([brDiaI,brDiaI,hA],3);
		//}
		translate([0,0,-hA])axis();
		//translate([0,brDiaI,-hA/2])rotate([90,0,0])cylinder(h=brDiaI*2,d=5.3);
		//translate([-brDiaI,0,-hA/2])rotate([0,90,0])cylinder(h=brDiaI*2,d=5.3);
	}
}

module kurbel(){
    diaO = brDiaO+6;;
		diaOB = pBrDiaO+6;
    l= kurbelL;
    h = kurbelH;
	  bDA = pBrH; //bearing depth A
	  bDB = pBrH+1; //bearing depth B
    difference(){
        hull(){
            translate([0,0,0])rotate([0,90,0])cylinder(d = diaO, h = h);
            translate([0,0,-l])rotate([0,90,0])cylinder(d = diaOB, h = h);
        }
       //translate([h+1,0,0])rotate([0,-90,0])cylinder(d = axisNutDia, h = axisNutH+1,$fn=6); 
       translate([-1,0,0])rotate([0,90,0])axis(); 
       
       translate([-1,0,-l])rotate([0,90,0])cylinder(d = pBrDiaO, h = bDA+1); 
       translate([h+1,0,-l])rotate([0,-90,0])cylinder(d = pBrDiaO, h = bDB+1);
       translate([-1,0,-l])rotate([0,90,0])cylinder(d = 14, h = h+2); 
			 
			 translate([h/2,0,0])rotate([0,0,0])cylinder(d = axisScrwD, h = l);
			 translate([h/2,l/2,0])rotate([90,0,0])cylinder(d = axisScrwD, h = l);
				
    }
     translate([0,0,-l])rotate([0,90,0])cylinder(d = pBrDiaO-3, h = bDA-0.6);
		 translate([h+9,0,0])rotate([0,0,0])axBrCnn();
        
}

module pedal(){
    h=80;
    diaO=13;
    w=40;
    
        difference(){
        hull(){
            translate([0,w/2,0])rotate([0,90,0])cylinder(d = diaO, h = h);
            translate([0,-w/2,0])rotate([0,90,0])cylinder(d = diaO, h = h);
        }
         translate([-5,0,0])rotate([0,90,0])cylinder(d = 7.6, h = h);
    }
}

module edgeMnt(scrwDia,headsink){
    diaO =20;
    length=genMntWI;
    difference(){
        hull(){
            translate([0,0,35])rotate([0,90,0])cylinder(d = diaO, h = length );
            translate([0,-diaO/2,0])cube([length,diaO,1]);
        }
        for ( i = [0:1:1]) {
            translate([-1,0,i*20+15])rotate([0,90,0])cylinder(d = scrwDia, h = length+2);
        }
        translate([length/4,diaO/2-4,-1])cylinder(d = scrwDia, h = 35 );
        translate([length*3/4,-diaO/2+4,-1])cylinder(d = scrwDia, h = 35 );
        translate([length*3/4,diaO/2-4,-1])cylinder(d = scrwDia, h = 35 );
        translate([length*1/4,-diaO/2+4,-1])cylinder(d = scrwDia, h = 35 );
				
				translate([length/4,diaO/2-4,-1])cylinder(d = scrwDia*2, h = headsink );
        translate([length*3/4,-diaO/2+4,-1])cylinder(d = scrwDia*2, h = headsink );
        translate([length*3/4,diaO/2-4,-1])cylinder(d = scrwDia*2, h = headsink );
        translate([length*1/4,-diaO/2+4,-1])cylinder(d = scrwDia*2, h = headsink );
    }
}

module spacer(){    
    difference(){
        cylinder(d = 10, h = genMntWI0, $fn=64,center=true);
        cylinder(d = 4.5, h = genMntWI+2, $fn=64,center=true);
        //translate([0,0,0])cylinder(d = brDiaI-0.6, h = wheelT+2,center=true);
    }
}

module rcube(size,radius){
$fn=32;
linear_extrude(height=size[2])
if(radius>0){
hull()
{
    // place 4 circles in the corners, with the given radius
    translate([(-size[0]/2)+(radius), (-size[1]/2)+(radius), 0])
    circle(r=radius);

    translate([(size[0]/2)-(radius), (-size[1]/2)+(radius), 0])
    circle(r=radius);

    translate([(-size[0]/2)+(radius), (size[1]/2)-(radius), 0])
    circle(r=radius);

    translate([(size[0]/2)-(radius), (size[1]/2)-(radius), 0])
    circle(r=radius);
}
}
if(radius==0){
translate([0,0,size[2]/2])cube(size,center=true);
}
}
