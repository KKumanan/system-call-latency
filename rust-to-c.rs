#[link(name = "mylib")]
extern "C" {
    fn hello();
}

use std::time::Instant;

fn main() {
    let start = Instant::now();
    let mut total: f64 = 0.0;

    for _ in 1..100000{
    	unsafe { hello(); }
    }
    let duration = start.elapsed();

	total += duration.as_nanos() as f64;

    let avg: f64 = total/100000.0;

    println!("Rust -> C average function call latency for 100000 calls: {} ns", avg);
}

