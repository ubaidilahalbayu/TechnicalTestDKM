<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Api extends RestController
{

    function __construct()
    {
        // Construct the parent class
        parent::__construct();

        // Load model 
        $this->load->model(array('hospital_Model'));
    }

    public function pasien_get()
    {
        $filter = [
            'tgl_awal' => date('Y-m-d', 1),
            'tgl_akhir' => date('Y-m-d'),
            'nm_pasien' => '',
            'nm_dokter' => ''
        ];
        $correct_filter = TRUE;
        foreach ($this->get() as $key => $value) {
            $cek_filter = FALSE;
            foreach ($filter as $key2 => $value2) {
                if ($key == $key2) {
                    $filter[$key] = $value;
                    $cek_filter = TRUE;
                }
            }
            if (!$cek_filter) {
                $correct_filter = FALSE;
                break;
            }
        }
        $data = $this->hospital_Model->get_pasien($filter);
        if (!$correct_filter) {
            $data = "Filter Incorrect";
        }
        if (is_array($data)) {
            if (count($data) == 0) {
                $data = "Data Not Found";
            }
        }
        $this->response($data, RESTController::HTTP_OK);
    }
}
