<?php
function gabungElemenArray($arr = array())
{
    if (count($arr) < 1) {
        return "Array is Empty";
    }
    $isInteger = TRUE;
    foreach ($arr as $key => $value) {
        if (!is_integer($value) || !is_integer($key)) {
            $isInteger = FALSE;
        }
    }
    if (!$isInteger) {
        return "There is an Array not Integer";
    }

    $terbesar = 0;
    for ($i = 0; $i < count($arr) - 1; $i++) {
        $cek = $arr[$i] * $arr[$i + 1];
        if ($cek > $terbesar) {
            $terbesar = $cek;
        }
    }
    return $terbesar;
}
echo gabungElemenArray([3, 6, -2, -5, 7, 3]);
