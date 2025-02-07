import cv2  
import sys  

def crop_image(image_path, x1, y1, x2, y2, output_path):  
    # 加载图像  
    image = cv2.imread(image_path)  

    # 检查图像是否加载成功  
    if image is None:  
        print("无法加载图像，请检查路径！")  
        return  

    # 图像的尺寸  
    height, width, _ = image.shape  
    print(f"图像尺寸：{width}x{height}")  

    # 检查坐标是否超出图像范围  
    if x1 < 0 or y1 < 0 or x2 > width or y2 > height:  
        print("截取区域超出图像范围，请检查坐标！")  
        return  

    # 截取图像  
    cropped_image = image[y1:y2, x1:x2]  

    # 保存截取的图像  
    cv2.imwrite(output_path, cropped_image)  
    print(f"截取的图像已保存到 {output_path}")  


if __name__ == "__main__":  
    # 检查参数数量  
    if len(sys.argv) != 7:  
        print("用法: python script.py <image_path> <x1> <y1> <x2> <y2> <output_path>")  
        print("示例: python script.py input.jpg 500 300 1000 800 cropped.jpg")  
        sys.exit(1)  

    # 获取命令行参数  
    image_path = sys.argv[1]  
    x1 = int(sys.argv[2])  
    y1 = int(sys.argv[3])  
    x2 = int(sys.argv[4])  
    y2 = int(sys.argv[5])  
    output_path = sys.argv[6]  

    # 调用函数  
    crop_image(image_path, x1, y1, x2, y2, output_path)