readonly x=2

function test {
	local x=1
	echo ${x}
}

test
echo $x
