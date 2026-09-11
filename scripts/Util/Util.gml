
function Approach(_current, _target, _amount) 
{
    return (_current < _target) 
        ? min(_current + _amount, _target) 
        : max(_current - _amount, _target);
}
