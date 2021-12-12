#declare N=100000;
#declare pcoord=array[N];

#declare xa=1;
#declare ya=1;
#declare za=1;

background { color rgb<0,0,0> }

#fopen Pts "temp.dat" read
#declare i=0;
#while (defined(Pts))
    #read(Pts,vec1)
    #declare pcoord[i]=vec1;
    #declare i=i+1;
#end

#fopen Cam "cam_temp.dat" read
#read(Cam,loc)

#fopen UpC "sky_temp.dat" read
#read(UpC,zpt)

camera {
  location 3*loc
  look_at  <0,0,0>
  right <-4/3,0,0>
  up <0,0,1>
  sky zpt
}

light_source { <3*xa,3*ya,3*za> color rgb<1,1,1>}
light_source { <3*xa,-3*ya,3*za> color rgb<1,1,1>}
light_source { <-3*xa,3*ya,3*za> color rgb<1,1,1>}
light_source { <-3*xa,-3*ya,3*za> color rgb<1,1,1>}
light_source { <3*xa,3*ya,-3*za> color rgb<1,1,1>}
light_source { <3*xa,-3*ya,-3*za> color rgb<1,1,1>}
light_source { <-3*xa,3*ya,-3*za> color rgb<1,1,1>}
light_source { <-3*xa,-3*ya,-3*za> color rgb<1,1,1>}

#declare j=0;
#while(j < i)
sphere {
  pcoord[j] , 0.005
  pigment { color rgb <1,0,0> }
  finish { metallic }
}
#declare j=j+1;
#end
