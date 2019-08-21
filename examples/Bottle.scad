include <../gospel.scad>

$fn = 100;

difference()
{
    draw_cover();
    draw_letters( "GEORGE" );
    //slit();

    y(30)
    z(-50)
    rx(100)
    inteleradLogo(30, 70);
}

module draw_cover()
{
    rotate_extrude()
    {   
        thickness=1;
        tolerance=1;
        
        rz( -90 )
        sy( 0.5 )
        polygon(
            points=
                [   [22, 38.8+tolerance],
                    [30, 38.8+tolerance],
                    [32.35,	38.8+tolerance],
                    [35, 40.1+tolerance],
                    [40, 45+tolerance],
                    [50, 52+tolerance],
                    [60, 58.65+tolerance],
                    [70, 63.65+tolerance],
                    [80, 67.25+tolerance],
                    [90, 70+tolerance],
                    //[100, 71.75+tolerance],
                    //[110, 72.75+tolerance],
                    //[110, 72.75+tolerance+thickness],
                    //[100, 71.75+tolerance+thickness],
                    [90, 70+tolerance+thickness],
                    [80, 67.25+tolerance+thickness],
                    [70, 63.65+tolerance+thickness],
                    [60, 58.65+tolerance+thickness],
                    [50, 52+tolerance+thickness],
                    [40, 45+tolerance+thickness],
                    [35, 40.1+tolerance+thickness],
                    [32.35, 38.8+tolerance+thickness],
                    [30, 38.8+tolerance+thickness],
                    [22, 38.8+tolerance+thickness]
            ],
            paths=
                [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21/*, 22, 23*/]]
        );
    }
}




module draw_letters( letters )
{
    count = len(letters);
    
    for ( i = [0:count] )
    {
        rz( 35*(i-count/2.5) )
        y(-20)
        z(-70)
        rx(80)
        linear_extrude(20)
        s(2)
        text(letters[i],
             font="Stencilia\\-Bold",
             valign="center",
             halign="center"
        );
    }
}

module slit()
{
    z(-10)
    cube([1, 50, 10]);
}

/**
 * @param extrudeDepth The depth in mm to extrude
 * @param scale The size to which scale the logo, default 10mm
 */
module inteleradLogo( extrudeDepth, scale = 10 )
{
    scale( [scale * 0.018, scale * 0.018, 1] )
    {
        translate( [ 73, 0, 0 ] )
        {
            rightWing( extrudeDepth );
            dot( extrudeDepth );
            leftWing( extrudeDepth );
        }
    }
}

module rightWing(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-253.144085,22.660125],[-251.961095,16.778968],[-250.207540,11.055503],[-247.972681,5.520327],[-245.345775,0.204035],[-242.416081,-4.862777],[-239.272859,-9.649513],[-232.702863,-18.260375],[-226.349856,-25.383785],[-220.927907,-30.774979],[-215.733464,-35.381653],[-213.440862,-36.938801],[-211.393599,-37.766875],[-209.629836,-37.892635],[-208.187734,-37.342836],[-207.105454,-36.144236],[-206.421157,-34.323592],[-206.173005,-31.907663],[-206.399157,-28.923204],[-223.523833,88.494990],[-224.156632,91.404831],[-225.077710,93.603214],[-226.243044,95.078959],[-227.608612,95.820885],[-229.130391,95.817811],[-230.764360,95.058557],[-232.466496,93.531941],[-234.192778,91.226783],[-237.803740,84.977891],[-241.407503,77.902123],[-245.401286,68.847143],[-249.178462,58.304201],[-250.796251,52.628261],[-252.132404,46.764550],[-253.111093,40.774475],[-253.656488,34.719441],[-253.692761,28.660856],[-253.144085,22.660125]]);
  }
}

module dot(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-226.519292,-64.431083],[-226.854957,-67.798222],[-227.515975,-71.051499],[-228.484885,-74.175162],[-229.744227,-77.153460],[-231.276541,-79.970640],[-233.064368,-82.610952],[-235.090247,-85.058643],[-237.336719,-87.297961],[-239.786323,-89.313155],[-242.421599,-91.088474],[-245.225089,-92.608164],[-248.179331,-93.856474],[-251.266866,-94.817654],[-254.470234,-95.475950],[-257.771974,-95.815611],[-261.154628,-95.820885],[-264.520902,-95.484953],[-267.773605,-94.824107],[-270.896957,-93.855734],[-273.875179,-92.597225],[-276.692490,-91.065965],[-279.333112,-89.279345],[-281.781264,-87.254752],[-284.021167,-85.009575],[-286.037041,-82.561201],[-287.813107,-79.927019],[-289.333585,-77.124418],[-290.582695,-74.170785],[-291.544658,-71.083509],[-292.203694,-67.879977],[-292.544024,-64.577580],[-292.549867,-61.193704],[-292.213365,-57.826504],[-291.551846,-54.573054],[-290.582721,-51.449123],[-289.323403,-48.470477],[-287.791304,-45.652885],[-286.003836,-43.012114],[-283.978410,-40.563932],[-281.732440,-38.324107],[-279.283338,-36.308406],[-276.648515,-34.532597],[-273.845384,-33.012447],[-270.891357,-31.763725],[-267.803846,-30.802198],[-264.600263,-30.143634],[-261.298021,-29.803800],[-257.914531,-29.798465],[-254.549003,-30.134876],[-251.296557,-30.796146],[-248.173056,-31.764894],[-245.194362,-33.023739],[-242.376340,-34.555303],[-239.734853,-36.342203],[-237.285763,-38.367060],[-235.044934,-40.612494],[-233.028230,-43.061124],[-231.251513,-45.695570],[-229.730646,-48.498451],[-228.481494,-51.452388],[-227.519920,-54.540000],[-226.861785,-57.743907],[-226.522955,-61.046728],[-226.519292,-64.431083]]);
  }
}

module leftWing(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-263.117170,23.375013],[-262.590483,28.665977],[-262.561017,33.967672],[-262.964851,39.231517],[-263.738067,44.408931],[-266.136971,54.310137],[-269.246377,63.282642],[-272.554934,70.937796],[-275.551290,76.886948],[-278.561997,82.112650],[-280.278621,84.389373],[-281.974318,85.888191],[-283.605224,86.620922],[-285.127475,86.599383],[-286.497211,85.835393],[-287.670566,84.340769],[-288.603679,82.127330],[-289.252687,79.206892],[-304.433848,-21.021389],[-304.675099,-24.008778],[-304.439370,-26.419739],[-303.764438,-28.228278],[-302.688083,-29.408403],[-301.248083,-29.934120],[-299.482218,-29.779437],[-297.428265,-28.918362],[-295.124005,-27.324901],[-290.721154,-23.351271],[-286.118499,-18.686065],[-280.715833,-12.503562],[-275.113761,-5.004981],[-269.912889,3.608456],[-267.650593,8.270364],[-265.713824,13.135528],[-264.177658,18.178795],[-263.117170,23.375013]]);
  }
}