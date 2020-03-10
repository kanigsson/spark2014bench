(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort slightly_extended_sequence_number_type 0)

(declare-fun slightly_extended_sequence_number_typeqtint (slightly_extended_sequence_number_type) Int)

;; slightly_extended_sequence_number_type'axiom
  (assert
  (forall ((i slightly_extended_sequence_number_type))
  (and (<= 1 (slightly_extended_sequence_number_typeqtint i))
  (<= (slightly_extended_sequence_number_typeqtint i) 100000000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 100000000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (slightly_extended_sequence_number_type
  slightly_extended_sequence_number_type) Bool)

(declare-const dummy slightly_extended_sequence_number_type)

(declare-datatypes ((slightly_extended_sequence_number_type__ref 0))
(((slightly_extended_sequence_number_type__refqtmk
  (slightly_extended_sequence_number_type__content slightly_extended_sequence_number_type)))))
(define-fun slightly_extended_sequence_number_type__ref_slightly_extended_sequence_number_type__content__projection ((a slightly_extended_sequence_number_type__ref)) slightly_extended_sequence_number_type 
  (slightly_extended_sequence_number_type__content a))

(define-fun to_rep ((x slightly_extended_sequence_number_type)) Int (slightly_extended_sequence_number_typeqtint
                                                                    x))

(declare-fun of_rep (Int) slightly_extended_sequence_number_type)

;; inversion_axiom
  (assert
  (forall ((x slightly_extended_sequence_number_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x slightly_extended_sequence_number_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort message_pointer 0)

(declare-fun message_pointerqtint (message_pointer) Int)

;; message_pointer'axiom
  (assert
  (forall ((i message_pointer))
  (and (<= (- 2147483648) (message_pointerqtint i))
  (<= (message_pointerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (message_pointer message_pointer) Bool)

(declare-const dummy1 message_pointer)

(declare-datatypes ((message_pointer__ref 0))
(((message_pointer__refqtmk (message_pointer__content message_pointer)))))
(define-fun message_pointer__ref_message_pointer__content__projection ((a message_pointer__ref)) message_pointer 
  (message_pointer__content a))

(define-fun to_rep1 ((x message_pointer)) Int (message_pointerqtint x))

(declare-fun of_rep1 (Int) message_pointer)

;; inversion_axiom
  (assert
  (forall ((x message_pointer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x message_pointer)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 8) message_pointer))))))
(declare-fun slide ((Array (_ BitVec 8) message_pointer) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) message_pointer))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) message_pointer)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) message_pointer)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 8) message_pointer))
  (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b (Array (_ BitVec 8) message_pointer)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_154 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_154)
                                    (bvule temp___idx_154 a__last))
                                    (= (to_rep1 (select a temp___idx_154)) 
                                    (to_rep1
                                    (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) message_pointer))
  (b (Array (_ BitVec 8) message_pointer)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array (_ BitVec 8) message_pointer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq2 ((Array (_ BitVec 8) message_pointer)
  (Array (_ BitVec 8) message_pointer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ordering_buffers__ordering_buffer_type__ring (Array (_ BitVec 8) message_pointer))(rec__ordering_buffers__ordering_buffer_type__first slightly_extended_sequence_number_type)))))
(define-fun us_split_fields_rec__ordering_buffers__ordering_buffer_type__ring__projection ((a us_split_fields)) (Array (_ BitVec 8) message_pointer) 
  (rec__ordering_buffers__ordering_buffer_type__ring a))

(define-fun us_split_fields_rec__ordering_buffers__ordering_buffer_type__first__projection ((a us_split_fields)) slightly_extended_sequence_number_type 
  (rec__ordering_buffers__ordering_buffer_type__first a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__ordering_buffers__ordering_buffer_type__ring
                           (us_split_fields1 a)) #x00 #x0F
                           (rec__ordering_buffers__ordering_buffer_type__ring
                           (us_split_fields1 b)) #x00 #x0F) true)
                        (= (to_rep
                           (rec__ordering_buffers__ordering_buffer_type__first
                           (us_split_fields1 a))) (to_rep
                                                  (rec__ordering_buffers__ordering_buffer_type__first
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const ordering_buffers__ordering_buffer_type__ring__first__bit Int)

(declare-const ordering_buffers__ordering_buffer_type__ring__last__bit Int)

(declare-const ordering_buffers__ordering_buffer_type__ring__position Int)

;; ordering_buffers__ordering_buffer_type__ring__first__bit_axiom
  (assert (<= 0 ordering_buffers__ordering_buffer_type__ring__first__bit))

;; ordering_buffers__ordering_buffer_type__ring__last__bit_axiom
  (assert
  (< ordering_buffers__ordering_buffer_type__ring__first__bit ordering_buffers__ordering_buffer_type__ring__last__bit))

;; ordering_buffers__ordering_buffer_type__ring__position_axiom
  (assert (<= 0 ordering_buffers__ordering_buffer_type__ring__position))

(declare-const ordering_buffers__ordering_buffer_type__first__first__bit Int)

(declare-const ordering_buffers__ordering_buffer_type__first__last__bit Int)

(declare-const ordering_buffers__ordering_buffer_type__first__position Int)

;; ordering_buffers__ordering_buffer_type__first__first__bit_axiom
  (assert (<= 0 ordering_buffers__ordering_buffer_type__first__first__bit))

;; ordering_buffers__ordering_buffer_type__first__last__bit_axiom
  (assert
  (< ordering_buffers__ordering_buffer_type__first__first__bit ordering_buffers__ordering_buffer_type__first__last__bit))

;; ordering_buffers__ordering_buffer_type__first__position_axiom
  (assert (<= 0 ordering_buffers__ordering_buffer_type__first__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((ordering_buffer_type__ref 0))
(((ordering_buffer_type__refqtmk (ordering_buffer_type__content us_rep)))))
(define-fun ordering_buffer_type__ref_ordering_buffer_type__content__projection ((a ordering_buffer_type__ref)) us_rep 
  (ordering_buffer_type__content a))

(declare-fun first (us_rep) Int)

(declare-fun first__function_guard (Int us_rep) Bool)

(declare-fun last (us_rep) Int)

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-fun has_message (us_rep Int) Bool)

(declare-fun has_message__function_guard (Bool us_rep Int) Bool)

(declare-fun temp_____aggregate_def_214 (Int) (Array (_ BitVec 8) message_pointer))

;; temp___result_219'def
  (assert
  (forall ((temp___218 us_rep)) (first__function_guard (first temp___218)
  temp___218)))

;; temp___result_220'def
  (assert
  (forall ((temp___218 us_rep)) (first__function_guard (first temp___218)
  temp___218)))

;; temp___result_221'def
  (assert
  (forall ((temp___218 us_rep)) (last__function_guard (last temp___218)
  temp___218)))

;; temp___result_222'def
  (assert
  (forall ((temp___218 us_rep) (index Int)) (has_message__function_guard
  (has_message temp___218 index) temp___218 index)))

(define-fun default_initial_assumption ((temp___expr_212 us_rep)
  (temp___skip_top_level_213 Bool)) Bool (and
                                         (and
                                         (= (rec__ordering_buffers__ordering_buffer_type__ring
                                            (us_split_fields1
                                            temp___expr_212)) (temp_____aggregate_def_214
                                                              0))
                                         (= (to_rep
                                            (rec__ordering_buffers__ordering_buffer_type__first
                                            (us_split_fields1
                                            temp___expr_212))) 1))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_213 true))
                                         (and (= (first temp___expr_212) 1)
                                         (forall ((index Int))
                                         (=>
                                         (and
                                         (<= (first temp___expr_212) index)
                                         (<= index (last temp___expr_212)))
                                         (not
                                         (= (has_message temp___expr_212
                                            index) true))))))))

(define-fun dynamic_invariant ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 100000000)) (in_range1
                                     temp___expr_179)))

;; first__post_axiom
  (assert
  (forall ((buffer us_rep))
  (! (let ((result (first buffer)))
     (=> (first__function_guard result buffer) (dynamic_invariant result true
     false true true))) :pattern ((first buffer)) )))

;; first__def_axiom
  (assert
  (forall ((buffer us_rep))
  (! (= (first buffer) (to_rep
                       (rec__ordering_buffers__ordering_buffer_type__first
                       (us_split_fields1 buffer)))) :pattern ((first buffer)) )))

(declare-sort extended_sequence_number_type 0)

(declare-fun extended_sequence_number_typeqtint (extended_sequence_number_type) Int)

;; extended_sequence_number_type'axiom
  (assert
  (forall ((i extended_sequence_number_type))
  (and (<= 1 (extended_sequence_number_typeqtint i))
  (<= (extended_sequence_number_typeqtint i) 100000015))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100000015)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (extended_sequence_number_type
  extended_sequence_number_type) Bool)

(declare-const dummy4 extended_sequence_number_type)

(declare-datatypes ((extended_sequence_number_type__ref 0))
(((extended_sequence_number_type__refqtmk
  (extended_sequence_number_type__content extended_sequence_number_type)))))
(define-fun extended_sequence_number_type__ref_extended_sequence_number_type__content__projection ((a extended_sequence_number_type__ref)) extended_sequence_number_type 
  (extended_sequence_number_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 1 100000015)) (in_range3
                                     temp___expr_172)))

;; last__post_axiom
  (assert
  (forall ((buffer us_rep))
  (! (let ((result (last buffer)))
     (=> (last__function_guard result buffer) (dynamic_invariant1 result true
     false true true))) :pattern ((last buffer)) )))

;; last__def_axiom
  (assert
  (forall ((buffer us_rep))
  (! (and
     (forall ((buffer1 us_rep)) (first__function_guard (first buffer1)
     buffer1)) (= (last buffer) (- (+ (first buffer) 16) 1))) :pattern (
  (last buffer)) )))

(declare-fun get_message (us_rep Int) Int)

(declare-fun get_message__function_guard (Int us_rep Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_186)))

;; get_message__post_axiom
  (assert
  (forall ((buffer us_rep))
  (forall ((index Int))
  (! (and
     (forall ((buffer1 us_rep)) (first__function_guard (first buffer1)
     buffer1))
     (and
     (forall ((buffer1 us_rep)) (last__function_guard (last buffer1)
     buffer1))
     (=>
     (and (dynamic_invariant1 index true true true true)
     (and (<= (first buffer) index) (<= index (last buffer))))
     (let ((result (get_message buffer index)))
     (=> (get_message__function_guard result buffer index)
     (dynamic_invariant2 result true false true true)))))) :pattern (
  (get_message buffer index)) ))))

;; get_message__def_axiom
  (assert
  (forall ((buffer us_rep))
  (forall ((index Int))
  (! (=> (dynamic_invariant1 index true true true true)
     (= (get_message buffer index) (to_rep1
                                   (let ((temp___236 (rec__ordering_buffers__ordering_buffer_type__ring
                                                     (us_split_fields1
                                                     buffer))))
                                   (select temp___236 ((_ int2bv 8) (mod2
                                                                    index
                                                                    256))))))) :pattern (
  (get_message buffer index)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const index Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const message Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const ring_index (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tsequence_number_typeB 0)

(declare-fun tsequence_number_typeBqtint (tsequence_number_typeB) Int)

;; tsequence_number_typeB'axiom
  (assert
  (forall ((i tsequence_number_typeB))
  (and (<= (- 2147483648) (tsequence_number_typeBqtint i))
  (<= (tsequence_number_typeBqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (tsequence_number_typeB tsequence_number_typeB) Bool)

(declare-const dummy5 tsequence_number_typeB)

(declare-datatypes ((tsequence_number_typeB__ref 0))
(((tsequence_number_typeB__refqtmk
  (tsequence_number_typeB__content tsequence_number_typeB)))))
(define-fun tsequence_number_typeB__ref_tsequence_number_typeB__content__projection ((a tsequence_number_typeB__ref)) tsequence_number_typeB 
  (tsequence_number_typeB__content a))

(declare-sort sequence_number_type 0)

(declare-fun sequence_number_typeqtint (sequence_number_type) Int)

;; sequence_number_type'axiom
  (assert
  (forall ((i sequence_number_type))
  (and (<= 1 (sequence_number_typeqtint i))
  (<= (sequence_number_typeqtint i) 99999999))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 99999999)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (sequence_number_type sequence_number_type) Bool)

(declare-const dummy6 sequence_number_type)

(declare-datatypes ((sequence_number_type__ref 0))
(((sequence_number_type__refqtmk
  (sequence_number_type__content sequence_number_type)))))
(define-fun sequence_number_type__ref_sequence_number_type__content__projection ((a sequence_number_type__ref)) sequence_number_type 
  (sequence_number_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 99999999)) (in_range5
                                     temp___expr_165)))

(declare-sort ring_index_type 0)

(define-fun in_range6 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x0F)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE6 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) (_ BitVec 8))

(declare-fun user_eq7 (ring_index_type ring_index_type) Bool)

(declare-const dummy7 ring_index_type)

(declare-datatypes ((ring_index_type__ref 0))
(((ring_index_type__refqtmk (ring_index_type__content ring_index_type)))))
(define-fun ring_index_type__ref_ring_index_type__content__projection ((a ring_index_type__ref)) ring_index_type 
  (ring_index_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_193 (_ BitVec 8))
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (or (= temp___is_init_189 true)
                                     (bvule #x00 #x0F)) (in_range6
                                     temp___expr_193)))

;; ring_index__def_axiom
  (assert (= ring_index ((_ int2bv 8) (mod2 index 256))))

(declare-fun is_null (Int) Bool)

(declare-fun is_null__function_guard (Bool Int) Bool)

;; is_null__post_axiom
  (assert true)

;; is_null__def_axiom
  (assert
  (forall ((message1 Int))
  (! (= (= (is_null message1) true) (= message1 0)) :pattern ((is_null
                                                              message1)) )))

;; has_message__post_axiom
  (assert
  (and
  (forall ((buffer us_rep)) (first__function_guard (first buffer) buffer))
  (forall ((buffer us_rep)) (last__function_guard (last buffer) buffer))))

;; has_message__def_axiom
  (assert
  (forall ((buffer us_rep))
  (forall ((index1 Int))
  (! (and
     (forall ((buffer1 us_rep) (index2 Int)) (get_message__function_guard
     (get_message buffer1 index2) buffer1 index2))
     (and
     (forall ((buffer1 us_rep) (index2 Int)) (get_message__function_guard
     (get_message buffer1 index2) buffer1 index2))
     (and
     (forall ((buffer1 us_rep) (index2 Int)) (is_null__function_guard
     (is_null (get_message buffer1 index2)) (get_message buffer1 index2)))
     (= (= (has_message buffer index1) true)
     (not (= (is_null (get_message buffer index1)) true)))))) :pattern (
  (has_message buffer index1)) ))))

(declare-const rliteral message_pointer)

;; rliteral_axiom
  (assert (= (message_pointerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___216 Int))
  (=> (dynamic_invariant2 temp___216 true true true true)
  (forall ((temp___217 (_ BitVec 8)))
  (= (select (temp_____aggregate_def_214 temp___216) temp___217) rliteral)))))

(assert
;; defqtvc
 ;; File "ordering_buffers.adb", line 3, characters 0-0
  (not
  (forall ((buffer__split_fields us_split_fields))
  (=> (dynamic_invariant3 index true false true true)
  (=> (dynamic_invariant2 message true false true true)
  (=>
  (forall ((buffer__split_fields1 us_split_fields)) (first__function_guard
  (first (us_repqtmk buffer__split_fields1))
  (us_repqtmk buffer__split_fields1)))
  (=> (<= (first (us_repqtmk buffer__split_fields)) index)
  (=>
  (forall ((buffer__split_fields1 us_split_fields)) (last__function_guard
  (last (us_repqtmk buffer__split_fields1))
  (us_repqtmk buffer__split_fields1)))
  (=> (<= index (last (us_repqtmk buffer__split_fields)))
  (=> (= ((_ int2bv 8) (mod2 index 256)) ring_index)
  (=> (dynamic_invariant4 ring_index true false true true)
  (forall ((o message_pointer))
  (=> (= (to_rep1 o) message)
  (forall ((buffer__split_fields1 us_split_fields))
  (=>
  (= buffer__split_fields1 (us_split_fieldsqtmk
                           (store (rec__ordering_buffers__ordering_buffer_type__ring
                                  buffer__split_fields) ring_index o)
                           (rec__ordering_buffers__ordering_buffer_type__first
                           buffer__split_fields)))
  (=>
  (forall ((buffer__split_fields2 us_split_fields)) (first__function_guard
  (first (us_repqtmk buffer__split_fields2))
  (us_repqtmk buffer__split_fields2)))
  (=>
  (forall ((buffer__split_fields2 us_split_fields)) (last__function_guard
  (last (us_repqtmk buffer__split_fields2))
  (us_repqtmk buffer__split_fields2)))
  (=>
  (forall ((i Int))
  (=>
  (and (<= (first (us_repqtmk buffer__split_fields1)) i)
  (<= i (last (us_repqtmk buffer__split_fields1))))
  (and (< (- 16) (- i index)) (< (- i index) 16))))
  (=>
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i 100000015))
  (=> (and (< (- 16) (- i index)) (< (- i index) 0))
  (not (= ((_ int2bv 8) (mod2 i 256)) ((_ int2bv 8) (mod2 index 256)))))))
  (=>
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i 100000015))
  (=> (and (< 0 (- i index)) (< (- i index) 16))
  (not (= ((_ int2bv 8) (mod2 i 256)) ((_ int2bv 8) (mod2 index 256)))))))
  (=>
  (forall ((buffer__split_fields2 us_split_fields)) (first__function_guard
  (first (us_repqtmk buffer__split_fields2))
  (us_repqtmk buffer__split_fields2)))
  (=>
  (forall ((buffer__split_fields2 us_split_fields)) (last__function_guard
  (last (us_repqtmk buffer__split_fields2))
  (us_repqtmk buffer__split_fields2)))
  (=>
  (forall ((i Int))
  (=>
  (and (<= (first (us_repqtmk buffer__split_fields1)) i)
  (<= i (last (us_repqtmk buffer__split_fields1))))
  (=> (not (= i index)) (not (= ((_ int2bv 8) (mod2 i 256)) ring_index)))))
  (=> (forall ((o1 us_rep)) (first__function_guard (first o1) o1))
  (=>
  (let ((o1 (us_repqtmk buffer__split_fields1)))
  (let ((o2 (last o1)))
  (and
  (and (last__function_guard o2 o1)
  (and (dynamic_invariant1 o2 true false true true)
  (= o2 (- (+ (first o1) 16) 1))))
  (let ((o3 (us_repqtmk buffer__split_fields1)))
  (let ((o4 (first o3)))
  (and (first__function_guard o4 o3)
  (and (dynamic_invariant o4 true false true true)
  (= o4 (to_rep
        (rec__ordering_buffers__ordering_buffer_type__first
        buffer__split_fields1))))))))))
  (=> (forall ((o1 us_rep)) (first__function_guard (first o1) o1))
  (<= (first (us_repqtmk buffer__split_fields1)) index)))))))))))))))))))))))))))
(check-sat)
(exit)
