return function(_)
    return {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
        },
    }
end
