import numpy as np
# import cv2
np.set_printoptions(threshold=np.inf)

def load_tensor(file):
    
    with open(file, "rb") as f:
        binary_data = f.read()

    magic_number, ndims, dtype = np.frombuffer(binary_data, np.uint32, count=3, offset=0)
    assert magic_number == 0xFCCFE2E2, f"{file} not a tensor file."
    
    dims = np.frombuffer(binary_data, np.uint32, count=ndims, offset=3 * 4)

    if dtype == 0:
        np_dtype = np.float32
    elif dtype == 1:
        np_dtype = np.float16
    else:
        assert False, f"Unsupport dtype = {dtype}, can not convert to numpy dtype"
        
    return np.frombuffer(binary_data, np_dtype, offset=(ndims + 3) * 4).reshape(*dims)

if __name__ == '__main__':
    input_tensor = load_tensor('/home/jiangziben/projects/yolov8/example-yolov8/workspace/input.in')    
    # print('input_tensor: ',input_tensor)
    # print('input_tensor.shape: ',input_tensor.shape)

    image = input_tensor * 255.0
    image = image[0][0,:,:]
    # print(image)
    # cv2.imwrite('image.png',image)
    # cv2.imshow("test",image.astype('uint8'))
    # cv2.waitKey(0) 

    output_tensor = load_tensor('/home/jiangziben/projects/yolov8/example-yolov8/workspace/output.out')    
    print('output_tensor: ',output_tensor)
    # print('output_tensor.shape: ',output_tensor.shape)
