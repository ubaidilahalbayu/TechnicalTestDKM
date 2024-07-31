function factorial(N) {
    if (!Number.isInteger(N)) {
        return "Not Integer";
    }
    if (N<0) {
        return "Not Defined";
    }
    if (N==0) {
        return 1;
    }
    var result = N;
    while (N>1) {
        --N;
        result *= N;
    }
    return result;
}
console.log(factorial(3));