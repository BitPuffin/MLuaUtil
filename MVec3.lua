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
    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        return {
            first_component[1] + second_component[1],
            first_component[2] + second_component[2],
            first_component[3] + second_component[3]
        }
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        return {
            first_component + second_component[1],
            first_component + second_component[2],
            first_component + second_component[3]
        }
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        return {
            second_component + first_component[1],
            second_component + first_component[2],
            second_component + first_component[3]
        }
    end
end

function MVec3.__sub(first_component, second_component)
    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        return {
            first_component[1] - second_component[1],
            first_component[2] - second_component[2],
            first_component[3] - second_component[3]
        }
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        return {
            first_component - second_component[1],
            first_component - second_component[2],
            first_component - second_component[3]
        }
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        return {
            second_component - first_component[1],
            second_component - first_component[2],
            second_component - first_component[3]
        }
    end
end

function MVec3.__mul(first_component, second_component)
    if getmetatable(first_component) is self and getmetatable(second_component) is self then
        return first_component.dot(second_component)
    end

    if type(first_component) is "number" and getmetatable(second_component) is self then
        return {
            first_component * second_component[1],
            first_component * second_component[2],
            first_component * second_component[3]
        }
    end

    if type(second_component) is "number" and getmetatable(first_component) is self then
        return {
            second_component * first_component[1],
            second_component * first_component[2],
            second_component * first_component[3]
        }
    end
end

function MVec3.dot(othervec)
    return self[1] * othervec[1] + self[2] * othervec[2] + self[3] * othervec[3]
end

function MVec3.cross(othervec)
    return {
        self[2]*othervec[3] - self[3]*othervec[2],
        self[3]*othervec[1] - self[1]*othervec[3],
        self[1]*othervec[2] - self[2]*othervec[1]
    }
end

function MVec3.magnitude()
    return math.sqrt(self.squaredMagnitude)
end

function MVec3.squaredMagnitude()
    return (self[1]^2 + self[2]^2 + self[3]^2)
end

function MVec3.normalize()
    return {
        self[1]/self.magnitude(),
        self[2]/self.magnitude(),
        self[3]/self.magnitude()
    }
end