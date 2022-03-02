$mtu = 1502
while($mtu -gt 0){
    echo "Trying buffer size of: $mtu";
    if(Test-Connection 8.8.8.8 -Count 1 -BufferSize $mtu -ErrorAction SilentlyContinue){
        msg * "Correct MTU: $mtu"
        echo "Correct MTU: $mtu"
        break
    }else{
        $mtu = $($mtu - 10)
    }
}
