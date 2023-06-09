function profile_test(n)
    for i = 1:n
        A = randn(100, 100, 20)
        m = maximum(A)
        Am = mapslices(sum, A; dims=2)
        B = A[:, :, 5]
        Bsort = mapslices(sort, B; dims=1)
        b = rand(100)
        C = B .* b
    end
end

# compilation
@profview profile_test(1)
# pure runtime
@profview profile_test(10)
@profview_allocs profile_test(10)