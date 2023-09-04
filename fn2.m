function F = fn2(fundamental_freq_wistle_key ,fundamental_freq_access)

if((abs(fundamental_freq_wistle_key - fundamental_freq_access))/fundamental_freq_wistle_key <= 0.05)
    fprintf('access granted');
else
    fprintf('access denied');
end
end
