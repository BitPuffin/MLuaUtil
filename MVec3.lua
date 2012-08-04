module(..., package.seeall)

MVec3 = {}

function MVec3:new(vec)
    local new_vector = {}
    if vec then
        new_vector[1] = vec[1]
        new_vector[2] = vec[2]
        new_vector[3] = vec[3]
    else
        new_vector = {0.0, 0.0, 0.0}
    end

    setmetatable(new_vector, self)
    self.__index = self
    return new_vector
end

function MVec3.__add(first_component, second_component)
    local vec = MVec3:new()

    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        vec[1] = first_component[1] + second_component[1]
        vec[2] = first_component[2] + second_component[2]
        vec[3] = first_component[3] + second_component[3]
        return vec
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        vec[1] = first_component + second_component[1]
        vec[2] = first_component + second_component[2]
        vec[3] = first_component + second_component[3]

        return vec
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        vec[1] = second_component + first_component[1]
        vec[2] = second_component + first_component[2]
        vec[3] = second_component + first_component[3]

        return vec
    end
end

function MVec3.__sub(first_component, second_component)
    local vec = MVec3:new()

    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        vec[1] = first_component[1] - second_component[1]
        vec[2] = first_component[2] - second_component[2]
        vec[3] = first_component[3] - second_component[3]
        return vec
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        vec[1] = first_component - second_component[1]
        vec[2] = first_component - second_component[2]
        vec[3] = first_component - second_component[3]

        return vec
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        vec[1] = second_component - first_component[1]
        vec[2] = second_component - first_component[2]
        vec[3] = second_component - first_component[3]

        return vec
    end
end

function MVec3.__mul(first_component, second_component)
    local vec = MVec3:new()

    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        vec = self.dot(first_component, second_component)
        return vec
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        vec[1] = first_component * second_component[1]
        vec[2] = first_component * second_component[2]
        vec[3] = first_component * second_component[3]

        return vec
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        vec[1] = second_component * first_component[1]
        vec[2] = second_component * first_component[2]
        vec[3] = second_component * first_component[3]

        return vec
    end
end

function MVec3.dot(vec1, vec2)

end

function MVec3.cross(vec1, vec2)

end