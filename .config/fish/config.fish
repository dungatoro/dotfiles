set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
function symble
    cd school/computing/wordle && python symble.py && cd
end
