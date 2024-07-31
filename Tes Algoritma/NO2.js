function tahunabad(tahun) {
    if (!Number.isInteger(tahun)) {
        return "Not Integer";
    }
    if (tahun < 1) {
        return "Not Found";
    }
    var abad = tahun/100;
    var pembulatan = Number(abad).toFixed(0);

    if ((abad-pembulatan > 0)) {
        abad = ++pembulatan;
    }
    return Number(abad).toFixed(0);
}
console.log(tahunabad(101));