return function(_)
    return {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy',
            },
        },
    }
end
