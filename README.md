# Draw Your Joy 🎨😄

[📄 Draw_Your_Joy.pdf 바로 보기](https://docs.google.com/viewer?url=https://raw.githubusercontent.com/jisunshin79/Draw-Your-Joy/main/Draw_Your_Joy.pdf)


An interactive ML-powered canvas that turns your smiles into color and your silence into grayscale. Inspired by Renoir's pursuit of happiness.

> “A painter who painted happiness” – Inspired by Renoir's philosophy of finding beauty in life.

## 🧠 Project Overview
**Draw Your Joy** is an interactive art + game experience that combines real-time machine learning and visual expression. A camera detects whether you are smiling or not:
- 😄 **If you smile**, your drawing remains in full color.
- 😐 **If you stop smiling**, the image slowly fades into grayscale.
- 🎨 You draw freely using the mouse, capturing moments of joy.

This project reflects the importance of happiness in a distrustful and cynical world, using technology to make you more aware of your own emotions.

## 🔧 Tech Stack
- **Wekinator** (Real-time ML model)
- **Processing (Java mode)** for interactive visuals
- **OSC (Open Sound Control)** for communication
- Smile classification using custom gestures (e.g., mouth height/width)
- Drawing interface with grayscale filter control

## 💡 How It Works
1. A real-time ML model classifies smile vs. non-smile using face geometry.
2. When the output value exceeds a threshold (e.g., > 0.8 → non-smile), the drawing canvas gradually turns grayscale.
3. Users draw on a canvas using the mouse; the drawing captures their emotional state.
4. Press the “Finish Drawing” button to finalize the image.

## 🖼️ Example Flow
1. Start the ML model in Wekinator
2. Open the Processing sketch and run it
3. Start drawing while smiling
4. See what happens when you stop smiling...

## 📸 Inspiration
This project is based on the spirit of painter **Pierre-Auguste Renoir**, who endured hardship yet always portrayed beauty. Just like his paintings, this system rewards joy and punishes apathy—not with violence, but with grayscale.

> “Whenever I see his painting, I find myself smiling.” 😊

## 🔗 Demo 

# Draw Your Joy 🎨😄

> "행복을 그린 화가" – 르누아르의 철학에서 영감을 받아 만든 인터랙티브 아트 프로젝트

## 🧠 프로젝트 개요
**Draw Your Joy**는 실시간 머신러닝과 감성 표현을 결합한 인터랙티브 아트 + 게임 프로젝트입니다. 사용자의 얼굴 표정을 분석하여, **웃고 있는지 여부에 따라 그림의 색상이 유지되거나 흑백으로 변합니다.**

- 😄 웃으면 그림은 컬러로 유지됩니다.
- 😐 웃지 않으면 점점 흑백으로 바뀝니다.
- 🎨 사용자는 마우스로 그림을 자유롭게 그릴 수 있습니다.

이 프로젝트를 통해 부정과 냉소로 가득 찬 세상에서, **'행복'과 '미소'의 중요성**을 다시 떠올리게 하고 싶었습니다.

## 🔧 사용 기술
- **Wekinator** (실시간 머신러닝 모델 훈련 및 예측)
- **Processing (Java mode)**를 이용한 그래픽 인터페이스
- **OSC (Open Sound Control)**로 Wekinator와 통신
- 사용자 얼굴에서 입의 너비/높이를 감지해 웃음 여부를 판단
- 웃음 여부에 따라 필터(컬러 or 흑백) 적용

## 💡 작동 방식
1. Wekinator에서 웃음/무표정 분류 모델을 학습
2. Processing에서 사용자 얼굴의 입 크기 등을 감지
3. Wekinator의 출력값이 특정 임계값(예: 0.8)을 넘으면 non-smile로 판단
4. 사용자는 마우스로 자유롭게 그림을 그리고,
   웃음을 유지하면 컬러, 멈추면 흑백으로 변함
5. ‘Finish Drawing’ 버튼을 누르면 최종 이미지가 캡처됨

## 📸 영감

이 프로젝트는 **르누아르(Pierre-Auguste Renoir)**의 삶에서 영감을 받았습니다. 가난과 병을 겪으면서도 세상을 원망하지 않고 아름다움을 그려낸 그의 태도처럼, 이 프로그램은 **즐거움을 지키는 사람에게만 색을 허락합니다.**

## 🖥️ 실행 방법
1. Wekinator 실행 및 모델 학습 (입력: mouth width/height, 출력: smile 여부)
2. Processing에서 코드 실행
3. 마우스로 그림을 그리며 웃음을 유지해보세요!

