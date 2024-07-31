<?php
function PatungSeniman($arrayPatung = array())
{
    if (count($arrayPatung) < 1) {
        return "Array is Empty";
    }
    $isInteger = TRUE;
    foreach ($arrayPatung as $key => $value) {
        if (!is_integer($value) || !is_integer($key)) {
            $isInteger = FALSE;
        }
    }
    if (!$isInteger) {
        return "There is an Array not Integer";
    }

    for ($i = 0; $i < count($arrayPatung) - 1; $i++) {
        if ($arrayPatung[$i] > $arrayPatung[$i + 1]) {
            $temp = $arrayPatung[$i];
            $arrayPatung[$i] = $arrayPatung[$i + 1];
            $arrayPatung[$i + 1] = $temp;
        }
    }
    $jumlah = 0;
    $patungPerlukan = array();
    for ($i = 0; $i < count($arrayPatung) - 1; $i++) {
        $cek = $arrayPatung[$i + 1] - $arrayPatung[$i];
        if ($cek > 1) {
            $jumlah += $cek - 1;
            for ($j = 1; $j < $cek; $j++) {
                array_push($patungPerlukan, $arrayPatung[$i] + $j);
            }
        }
    }
    $return = ["Jumlah Patung yang diperlukan" => $jumlah, "Patung tinggi yang diperlukan" => $patungPerlukan];
    return json_encode($return);
}
echo PatungSeniman([6, 2, 3, 8]);
