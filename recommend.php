<?php 
function sim_dis($matrix, $p1, $p2)
{
    $similar=array();
    $sum=0;

    foreach($matrix[$p1] as $key=>$value)
    {
        if(array_key_exists($key,$matrix[$p2]))
        {
            $similar[$key]=1;
        }
    }
        if($similar==0)
        {
            return 0;
        }

        foreach($matrix[$p1] as $key=>$value)
    {
        if(array_key_exists($key,$matrix[$p2]))
        {
          $sum=$sum+pow($value-$matrix[$p2][$key],2);
        }
    }
    return 1/(1+sqrt($sum));

}


function gerecom($matrix, $p)
{
    $total=array();
    $simsums=array();
    $ranks=array();


    foreach($matrix as $op=>$value)
    {
        if($op!=$p)
        {
            $sim=sim_dis($matrix,$p,$op);
            
            foreach($matrix[$op] as $key=>$value)
            {
                if(!array_key_exists($key,$matrix[$p]))
                {

                    if(!array_key_exists($key,$total))
                    {

                        $total[$key]=0;
                    }

                    $total[$key]+=$matrix[$op] [$key]*$sim;

                    if(!array_key_exists($key,$simsums))
                    {
                        $simsums[$key]=0;
                    }
                    $simsums[$key]+=$sim;

                }
            }
        }
    }
    foreach($total as $key=>$value)
    {
        $ranks[$key]=$value/$simsums[$key];
    
    }
    array_multisort($ranks,SORT_DESC);
        return $ranks;


}

?>