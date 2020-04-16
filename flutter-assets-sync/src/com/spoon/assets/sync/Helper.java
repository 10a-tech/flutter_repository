package com.spoon.assets.sync;

import com.intellij.openapi.ui.Messages;


import java.io.File;
import java.util.*;

import static com.spoon.assets.sync.Constants.PUBSPEC;

public class Helper {

    private static ArrayList<String> assetFiles = null;
    private static ArrayList<String> projFiles = null;

    private HashSet<String> assetsNames = null;

    public Helper() {
        assetFiles = new ArrayList<>();
        assetFiles.add("asset");
        assetFiles.add("assets");
        assetFiles.add("images");

        projFiles = new ArrayList<>();
        projFiles.add("android");
        projFiles.add("ios");
        projFiles.add("lib");
        projFiles.add("pubspec.lock");
        projFiles.add(PUBSPEC);

        assetsNames = new HashSet<>();
    }

    public boolean checkFlutterProj(String path) {
        if (path == null || path.isEmpty()) {
            return false;
        }
        File dir = new File(path);
        if (!dir.exists() || !dir.isDirectory()) {
            showErrMsg(Constants.NOT_FLUTTER);
        }
        return isAllFilesContained(Objects.requireNonNull(dir.list()), projFiles);
    }

    private boolean isAllFilesContained(String[] files, ArrayList<String> checkFiles) {
        int cnt = 0;
        for (String f : files) {
            if (checkFiles.contains(f)) {
                cnt++;
            }
        }
        return cnt >= checkFiles.size();
    }

    public boolean checkAssets(String path) {
        File dir = new File(path);
        String[] files = Objects.requireNonNull(dir.list());
        int cnt = 0;
        for (String f : files) {
            if (assetFiles.contains(f)) {
                cnt++;
            }
        }
        return cnt > 0;
    }

    /**
     * 获取assets下的图片资源列表
     *
     * @param path
     * @return
     */
    public List<String> getAssets(String path) {
        System.out.println("Scanning asset files under asset, assets and images...");
        assetsNames.clear();
        List<String> assets = new ArrayList<>();
        for (String name : assetFiles) {
            File dir = new File(path, name);
            getAssets(assets, dir, name);
        }
        return assets;
    }

    private void getAssets(List<String> assets, File dir, String prefix) {
        if (!dir.exists() || !dir.isDirectory()) {
            return;
        }
        File[] files = dir.listFiles();
        if (files == null) {
            return;
        }
        List<File> fList = Arrays.asList(files);
        /* 处理资源变体，参考：
          https://flutterchina.club/assets-and-images/
          https://flutter.dev/docs/development/ui/assets-and-images
        */
        // 重新排序，文件排在目录前面。先处理文件，然后处理下级目录，方便处理资源变体
        fList.sort((o1, o2) -> {
            if (o1.isFile() && o2.isDirectory()) {
                return -1;
            } else if (o1.isDirectory() && o2.isFile()) {
                return 1;
            }
            return 0;
        });
        for (File f : fList) {
            String name = f.getName();
            if (name.contains(".DS_Store")) {
                continue;
            }
            if (f.isFile()) {
                // 如果添加过同名的，则认为当前资源为一个变体，不再添加
                if (!assetsNames.contains(name)) {
                    assetsNames.add(name);
                    String asset = "    - " + prefix + "/" + name;
                    assets.add(asset);
                }
            } else {
                // 2.0x 3.0x 等多分辨率目录处理
                if (name.matches("^[1-9](\\.\\d)x$")) {
                    getAssets(assets, f, prefix);
                } else {
                    getAssets(assets, f, prefix + "/" + name);
                }
            }
        }
    }

    /**
     * 展示错误信息
     *
     * @param msg
     */
    public static void showErrMsg(String msg) {
        Messages.showMessageDialog(msg, "Flutter Assets Sync", Messages.getErrorIcon());
    }

    /**
     * 展示成功信息
     */
    public static void showSuccessInfo() {
        Messages.showMessageDialog("Assets 引用已成功更新.",
                "Flutter Assets Sync", Messages.getInformationIcon());
    }

}
