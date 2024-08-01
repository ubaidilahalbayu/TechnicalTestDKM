<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Hospital_Model extends CI_Model
{
    public function get_pasien($filter)
    {
        $query = "SELECT periksa_pasien.no_rekam_medis, pasien.nama_pasien, pasien.NIK,
        registrasi_pasien.no_registrasi, registrasi_pasien.tgl_registrasi, poli.nm_poli AS poli_tujuan,
        dokter.kd_dokter, dokter.nm_dokter, periksa_pasien.ket_diagnosa
        FROM periksa_pasien
        INNER JOIN pasien ON periksa_pasien.no_rekam_medis = pasien.no_rekam_medis
        INNER JOIN registrasi_pasien ON periksa_pasien.no_rekam_medis = registrasi_pasien.no_rekam_medis
        INNER JOIN poli ON registrasi_pasien.id_poli_tujuan = poli.id_poli
        INNER JOIN dokter ON periksa_pasien.kd_dokter = dokter.kd_dokter
        WHERE registrasi_pasien.tgl_registrasi >= '" . $filter['tgl_awal'] . "' AND
        registrasi_pasien.tgl_registrasi <= '" . $filter['tgl_akhir'] . "' AND
        pasien.nama_pasien LIKE '" . $filter['nm_pasien'] . "%' AND
        dokter.nm_dokter LIKE '" . $filter['nm_dokter'] . "%'";
        if ($this->db->simple_query($query)) {
            return $this->db->query($query)->result_array();
        } else {
            return $this->db->error();
        }
    }
}