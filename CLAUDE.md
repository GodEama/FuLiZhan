# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

This is an iOS project using CocoaPods. **IJKMediaFramework.framework must be manually downloaded** before building:
1. Download from https://pan.baidu.com/s/1IJgUxZew0FZUHRrvSp-FiA
2. Extract to project root directory

```bash
# Install dependencies
pod install

# Open in Xcode
open FuliZhan.xcworkspace
```

## Architecture

**Navigation Flow:**
```
MyChannelsViewController (platform grid)
    └── AnchorViewController (streamer list per platform)
            └── PlayViewController (IJKMediaFramework video player)

KYJPlayViewController (separate adult content section with BMPlayer)
```

**Video Players:**
- `PlayViewController` uses `IJKFFMoviePlayerController` from IJKMediaFramework
- `KYJPlayViewController` uses `BMPlayer` (custom build from GitHub)

**Key Dependencies:**
- `Alamofire` - Networking
- `HandyJSON` - JSON deserialization to model structs
- `Kingfisher` - Image loading/caching
- `SnapKit` - Auto Layout DSL
- `IJKMediaFramework` - Main video playback (manual install required)
- `BMPlayer` - Alternative player for KYJ section

**Custom Cell Registration:**
Cells use `RegisterCellFromNib` protocol with extensions:
- `gxj_registerCell<T>()` - Register cell (from nib if available, otherwise programmatic)
- `gxj_dequeueReusableCell<T>(indexPath:)` - Dequeue with type inference
- Same pattern for `UICollectionView` and `UITableView`

**Models (HandyJSON):**
- `Video` / `MyChannel` - Main platform/streamer data
- `InfoItem` / `Userinfo` / `Musicinfo` - KYJ section models

**Network API:**
- `NetworkTool.loadMyChannels1_6()` - Fetches platform list from `http://api.hclyz.com:81/mf/json.txt`
- `NetworkTool.loadMyAnchors(param:)` - Fetches streamer list per platform
- `NetworkTool.loadKYJVideos(page:)` - KYJ video feed from `https://www.dnfzhushou3.cn`
- `NetworkTool.downloadVideo(url:)` - Saves video to photo library

**Global Constants (Const.swift):**
- `screenWidth`, `screenHeight` - Screen dimensions
- `kTopHeight` - Nav bar height (88 for iPhone X, 64 otherwise)
- `BASE_URL`, `device_id`, `IID` - Unused legacy constants
