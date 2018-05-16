package com.detailList.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

import com.sun.jmx.snmp.Timestamp;

public class FileUtils {
	/**
	 * 将上传的图片保存到本地f盘的工具类。 原名称
	 * 
	 * @param request
	 *            请求
	 * @param file
	 *            文件
	 * @param
	 * @return 完整文件路径
	 */
	public static String uploadFile(MultipartFile file) {
		String rootUrl = "D" + "://" + "workEnclosure/";// 根目录，
		// 上传
		try {
			if (file != null) {
				String origName = file.getOriginalFilename();// 文件原名称
				System.out.println("上传的文件原名称:" + origName);
				String fileSrc = "";
				try {
					fileSrc = rootUrl + "//" + new Timestamp().getDateTime() +origName;
					File uploadedFile = new File(fileSrc);
					OutputStream os = new FileOutputStream(uploadedFile);
					InputStream is = file.getInputStream();
					byte buf[] = new byte[1024];// 可以修改 1024 以提高读取速度
					int length = 0;
					while ((length = is.read(buf)) > 0) {
						os.write(buf, 0, length);
					}
					// 关闭流
					os.flush();
					is.close();
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return fileSrc;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
