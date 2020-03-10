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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

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

(declare-sort os_mbx_index_t 0)

(define-fun in_range ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                             (bvule x #x02)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 8))

(declare-fun user_eq (os_mbx_index_t os_mbx_index_t) Bool)

(declare-const dummy os_mbx_index_t)

(declare-datatypes ((os_mbx_index_t__ref 0))
(((os_mbx_index_t__refqtmk (os_mbx_index_t__content os_mbx_index_t)))))
(define-fun os_mbx_index_t__ref_os_mbx_index_t__content__projection ((a os_mbx_index_t__ref)) os_mbx_index_t 
  (os_mbx_index_t__content a))

(declare-fun to_rep (os_mbx_index_t) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) os_mbx_index_t)

;; inversion_axiom
  (assert
  (forall ((x os_mbx_index_t))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x os_mbx_index_t)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (let ((y (bvurem x #x03))) (=> (in_range y) (= (to_rep (of_rep x)) y))) :pattern (
  (to_rep (of_rep x))) )))

(define-fun to_int2 ((x os_mbx_index_t)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x os_mbx_index_t)) (! (in_range_int
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-sort os_mbx_count_t 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(define-fun in_range1 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x03)))

(define-fun in_range_int1 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (os_mbx_count_t os_mbx_count_t) Bool)

(declare-const dummy1 os_mbx_count_t)

(declare-datatypes ((os_mbx_count_t__ref 0))
(((os_mbx_count_t__refqtmk (os_mbx_count_t__content os_mbx_count_t)))))
(define-fun os_mbx_count_t__ref_os_mbx_count_t__content__projection ((a os_mbx_count_t__ref)) os_mbx_count_t 
  (os_mbx_count_t__content a))

(declare-fun to_rep1 (os_mbx_count_t) (_ BitVec 8))

(declare-fun of_rep1 ((_ BitVec 8)) os_mbx_count_t)

;; inversion_axiom
  (assert
  (forall ((x os_mbx_count_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x os_mbx_count_t)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun to_int3 ((x os_mbx_count_t)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x os_mbx_count_t)) (! (in_range_int1
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-sort os_task_id_t 0)

(declare-fun os_task_id_tqtint (os_task_id_t) Int)

;; os_task_id_t'axiom
  (assert
  (forall ((i os_task_id_t))
  (and (<= (- 1) (os_task_id_tqtint i)) (<= (os_task_id_tqtint i) 4))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 1) x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (os_task_id_t os_task_id_t) Bool)

(declare-const dummy2 os_task_id_t)

(declare-datatypes ((os_task_id_t__ref 0))
(((os_task_id_t__refqtmk (os_task_id_t__content os_task_id_t)))))
(define-fun os_task_id_t__ref_os_task_id_t__content__projection ((a os_task_id_t__ref)) os_task_id_t 
  (os_task_id_t__content a))

(define-fun to_rep2 ((x os_task_id_t)) Int (os_task_id_tqtint x))

(declare-fun of_rep2 (Int) os_task_id_t)

;; inversion_axiom
  (assert
  (forall ((x os_task_id_t))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x os_task_id_t)) (! (in_range2
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort os_mbx_msg_t 0)

(declare-fun os_mbx_msg_tqtint (os_mbx_msg_t) Int)

;; os_mbx_msg_t'axiom
  (assert
  (forall ((i os_mbx_msg_t))
  (and (<= 0 (os_mbx_msg_tqtint i)) (<= (os_mbx_msg_tqtint i) 4294967295))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 4294967295)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (os_mbx_msg_t os_mbx_msg_t) Bool)

(declare-const dummy3 os_mbx_msg_t)

(declare-datatypes ((os_mbx_msg_t__ref 0))
(((os_mbx_msg_t__refqtmk (os_mbx_msg_t__content os_mbx_msg_t)))))
(define-fun os_mbx_msg_t__ref_os_mbx_msg_t__content__projection ((a os_mbx_msg_t__ref)) os_mbx_msg_t 
  (os_mbx_msg_t__content a))

(define-fun to_rep3 ((x os_mbx_msg_t)) Int (os_mbx_msg_tqtint x))

(declare-fun of_rep3 (Int) os_mbx_msg_t)

;; inversion_axiom
  (assert
  (forall ((x os_mbx_msg_t))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x os_mbx_msg_t)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test__os_mbx_entry_t__sender_id os_task_id_t)(rec__test__os_mbx_entry_t__msg os_mbx_msg_t)))))
(define-fun us_split_fields_rec__test__os_mbx_entry_t__sender_id__projection ((a us_split_fields)) os_task_id_t 
  (rec__test__os_mbx_entry_t__sender_id a))

(define-fun us_split_fields_rec__test__os_mbx_entry_t__msg__projection ((a us_split_fields)) os_mbx_msg_t 
  (rec__test__os_mbx_entry_t__msg a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2
                           (rec__test__os_mbx_entry_t__sender_id
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__test__os_mbx_entry_t__sender_id
                                                  (us_split_fields1 b))))
                        (= (to_rep3
                           (rec__test__os_mbx_entry_t__msg
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__test__os_mbx_entry_t__msg
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test__os_mbx_entry_t__sender_id__first__bit Int)

(declare-const test__os_mbx_entry_t__sender_id__last__bit Int)

(declare-const test__os_mbx_entry_t__sender_id__position Int)

;; test__os_mbx_entry_t__sender_id__first__bit_axiom
  (assert (<= 0 test__os_mbx_entry_t__sender_id__first__bit))

;; test__os_mbx_entry_t__sender_id__last__bit_axiom
  (assert
  (< test__os_mbx_entry_t__sender_id__first__bit test__os_mbx_entry_t__sender_id__last__bit))

;; test__os_mbx_entry_t__sender_id__position_axiom
  (assert (<= 0 test__os_mbx_entry_t__sender_id__position))

(declare-const test__os_mbx_entry_t__msg__first__bit Int)

(declare-const test__os_mbx_entry_t__msg__last__bit Int)

(declare-const test__os_mbx_entry_t__msg__position Int)

;; test__os_mbx_entry_t__msg__first__bit_axiom
  (assert (<= 0 test__os_mbx_entry_t__msg__first__bit))

;; test__os_mbx_entry_t__msg__last__bit_axiom
  (assert
  (< test__os_mbx_entry_t__msg__first__bit test__os_mbx_entry_t__msg__last__bit))

;; test__os_mbx_entry_t__msg__position_axiom
  (assert (<= 0 test__os_mbx_entry_t__msg__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((os_mbx_entry_t__ref 0))
(((os_mbx_entry_t__refqtmk (os_mbx_entry_t__content us_rep)))))
(define-fun os_mbx_entry_t__ref_os_mbx_entry_t__content__projection ((a os_mbx_entry_t__ref)) us_rep 
  (os_mbx_entry_t__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 8) us_rep))))))
(declare-fun slide ((Array (_ BitVec 8) us_rep) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) us_rep))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) us_rep)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) us_rep)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array (_ BitVec 8) us_rep)) (a__first (_ BitVec 8))
  (a__last (_ BitVec 8)) (b (Array (_ BitVec 8) us_rep))
  (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_154 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_154)
                                    (bvule temp___idx_154 a__last))
                                    (= (bool_eq (select a temp___idx_154)
                                       (select b (bvadd (bvsub b__first a__first) temp___idx_154))) true))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) us_rep)) (b (Array (_ BitVec 8) us_rep)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (bvadd (bvsub b__first a__first) temp___idx_154))) true))))))))

(declare-const dummy5 (Array (_ BitVec 8) us_rep))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 ((Array (_ BitVec 8) us_rep)
  (Array (_ BitVec 8) us_rep)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__test__os_mbx_t__head os_mbx_index_t)(rec__test__os_mbx_t__count os_mbx_count_t)(rec__test__os_mbx_t__mbx_array (Array (_ BitVec 8) us_rep))))))
(define-fun us_split_fields_rec__test__os_mbx_t__head__projection ((a us_split_fields2)) os_mbx_index_t 
  (rec__test__os_mbx_t__head a))

(define-fun us_split_fields_rec__test__os_mbx_t__count__projection ((a us_split_fields2)) os_mbx_count_t 
  (rec__test__os_mbx_t__count a))

(define-fun us_split_fields_rec__test__os_mbx_t__mbx_array__projection ((a us_split_fields2)) (Array (_ BitVec 8) us_rep) 
  (rec__test__os_mbx_t__mbx_array a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__test__os_mbx_t__head (us_split_fields3 a))) 
                         (to_rep
                         (rec__test__os_mbx_t__head (us_split_fields3 b))))
                         (= (to_rep1
                            (rec__test__os_mbx_t__count (us_split_fields3 a))) 
                         (to_rep1
                         (rec__test__os_mbx_t__count (us_split_fields3 b)))))
                         (= (bool_eq1
                            (rec__test__os_mbx_t__mbx_array
                            (us_split_fields3 a)) #x00 #x02
                            (rec__test__os_mbx_t__mbx_array
                            (us_split_fields3 b)) #x00 #x02) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test__os_mbx_t__head__first__bit Int)

(declare-const test__os_mbx_t__head__last__bit Int)

(declare-const test__os_mbx_t__head__position Int)

;; test__os_mbx_t__head__first__bit_axiom
  (assert (<= 0 test__os_mbx_t__head__first__bit))

;; test__os_mbx_t__head__last__bit_axiom
  (assert
  (< test__os_mbx_t__head__first__bit test__os_mbx_t__head__last__bit))

;; test__os_mbx_t__head__position_axiom
  (assert (<= 0 test__os_mbx_t__head__position))

(declare-const test__os_mbx_t__count__first__bit Int)

(declare-const test__os_mbx_t__count__last__bit Int)

(declare-const test__os_mbx_t__count__position Int)

;; test__os_mbx_t__count__first__bit_axiom
  (assert (<= 0 test__os_mbx_t__count__first__bit))

;; test__os_mbx_t__count__last__bit_axiom
  (assert
  (< test__os_mbx_t__count__first__bit test__os_mbx_t__count__last__bit))

;; test__os_mbx_t__count__position_axiom
  (assert (<= 0 test__os_mbx_t__count__position))

(declare-const test__os_mbx_t__mbx_array__first__bit Int)

(declare-const test__os_mbx_t__mbx_array__last__bit Int)

(declare-const test__os_mbx_t__mbx_array__position Int)

;; test__os_mbx_t__mbx_array__first__bit_axiom
  (assert (<= 0 test__os_mbx_t__mbx_array__first__bit))

;; test__os_mbx_t__mbx_array__last__bit_axiom
  (assert
  (< test__os_mbx_t__mbx_array__first__bit test__os_mbx_t__mbx_array__last__bit))

;; test__os_mbx_t__mbx_array__position_axiom
  (assert (<= 0 test__os_mbx_t__mbx_array__position))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((os_mbx_t__ref 0))
(((os_mbx_t__refqtmk (os_mbx_t__content us_rep1)))))
(define-fun os_mbx_t__ref_os_mbx_t__content__projection ((a os_mbx_t__ref)) us_rep1 
  (os_mbx_t__content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_rep1))))))
(declare-fun slide1 ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq2 (select a temp___idx_155)
                              (select b (+ (- b__first a__first) temp___idx_155))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq2 (select a temp___idx_155)
     (select b (+ (- b__first a__first) temp___idx_155))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun os_mbx_get_mbx_head (Int (Array Int us_rep1)) (_ BitVec 8))

(declare-fun os_mbx_get_mbx_head__function_guard ((_ BitVec 8) Int
  (Array Int us_rep1)) Bool)

(declare-sort os_task_id_param_t 0)

(declare-fun os_task_id_param_tqtint (os_task_id_param_t) Int)

;; os_task_id_param_t'axiom
  (assert
  (forall ((i os_task_id_param_t))
  (and (<= 0 (os_task_id_param_tqtint i)) (<= (os_task_id_param_tqtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (os_task_id_param_t os_task_id_param_t) Bool)

(declare-const dummy7 os_task_id_param_t)

(declare-datatypes ((os_task_id_param_t__ref 0))
(((os_task_id_param_t__refqtmk
  (os_task_id_param_t__content os_task_id_param_t)))))
(define-fun os_task_id_param_t__ref_os_task_id_param_t__content__projection ((a os_task_id_param_t__ref)) os_task_id_param_t 
  (os_task_id_param_t__content a))

(define-fun dynamic_invariant ((temp___expr_233 Int)
  (temp___is_init_229 Bool) (temp___skip_constant_230 Bool)
  (temp___do_toplevel_231 Bool)
  (temp___do_typ_inv_232 Bool)) Bool (=>
                                     (or (= temp___is_init_229 true)
                                     (<= 0 4)) (in_range4 temp___expr_233)))

(define-fun dynamic_invariant1 ((temp___expr_277 (_ BitVec 8))
  (temp___is_init_273 Bool) (temp___skip_constant_274 Bool)
  (temp___do_toplevel_275 Bool)
  (temp___do_typ_inv_276 Bool)) Bool (=>
                                     (or (= temp___is_init_273 true)
                                     (bvule #x00 #x02)) (in_range
                                     temp___expr_277)))

;; os_mbx_get_mbx_head__post_axiom
  (assert
  (forall ((task_id Int))
  (forall ((test__os_task_mbx_rw (Array Int us_rep1)))
  (! (=> (dynamic_invariant task_id true true true true)
     (let ((result (os_mbx_get_mbx_head task_id test__os_task_mbx_rw)))
     (=> (os_mbx_get_mbx_head__function_guard result task_id
     test__os_task_mbx_rw) (dynamic_invariant1 result true false true true)))) :pattern (
  (os_mbx_get_mbx_head task_id test__os_task_mbx_rw)) ))))

;; os_mbx_get_mbx_head__def_axiom
  (assert
  (forall ((task_id Int))
  (forall ((test__os_task_mbx_rw (Array Int us_rep1)))
  (! (=> (dynamic_invariant task_id true true true true)
     (= (os_mbx_get_mbx_head task_id test__os_task_mbx_rw) (to_rep
                                                           (rec__test__os_mbx_t__head
                                                           (us_split_fields3
                                                           (select test__os_task_mbx_rw task_id)))))) :pattern (
  (os_mbx_get_mbx_head task_id test__os_task_mbx_rw)) ))))

(declare-fun oadd ((_ BitVec 8) (_ BitVec 8)) (_ BitVec 8))

(declare-fun oadd__function_guard ((_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun dynamic_invariant2 ((temp___expr_298 (_ BitVec 8))
  (temp___is_init_294 Bool) (temp___skip_constant_295 Bool)
  (temp___do_toplevel_296 Bool)
  (temp___do_typ_inv_297 Bool)) Bool (=>
                                     (or (= temp___is_init_294 true)
                                     (bvule #x00 #x03)) (in_range1
                                     temp___expr_298)))

;; oadd__post_axiom
  (assert
  (forall ((left (_ BitVec 8)) (right (_ BitVec 8)))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant2
     right true true true true))
     (let ((result (oadd left right)))
     (=> (oadd__function_guard result left right) (dynamic_invariant1 result
     true false true true)))) :pattern ((oadd left right)) )))

;; oadd__def_axiom
  (assert
  (forall ((left (_ BitVec 8)) (right (_ BitVec 8)))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant2
     right true true true true))
     (= (oadd left right) (let ((temp___341 (bvadd left (bvurem right ((_ int2bv 8) 256)))))
                          (ite (bvule (bvsub #x03 left) (bvurem right ((_ int2bv 8) 256)))
                          (bvsub temp___341 #x03) temp___341)))) :pattern (
  (oadd left right)) )))

(declare-const task_id Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const index (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant3 ((temp___expr_226 Int)
  (temp___is_init_222 Bool) (temp___skip_constant_223 Bool)
  (temp___do_toplevel_224 Bool)
  (temp___do_typ_inv_225 Bool)) Bool (=>
                                     (or (= temp___is_init_222 true)
                                     (<= (- 1) 4)) (in_range2
                                     temp___expr_226)))

(define-fun dynamic_invariant4 ((temp___expr_261 Int)
  (temp___is_init_257 Bool) (temp___skip_constant_258 Bool)
  (temp___do_toplevel_259 Bool)
  (temp___do_typ_inv_260 Bool)) Bool (=>
                                     (or (= temp___is_init_257 true)
                                     (<= 0 4294967295)) (in_range3
                                     temp___expr_261)))

(assert
;; defqtvc
 ;; File "test.adb", line 163, characters 0-0
  (not
  (forall ((os_task_mbx_rw (Array Int us_rep1)))
  (=> (dynamic_invariant task_id true false true true)
  (=> (dynamic_invariant2 index true false true true)
  (=>
  (forall ((os_task_mbx_rw1 (Array Int us_rep1)))
  (os_mbx_get_mbx_head__function_guard
  (os_mbx_get_mbx_head task_id os_task_mbx_rw1) task_id os_task_mbx_rw1))
  (=>
  (forall ((os_task_mbx_rw1 (Array Int us_rep1)))
  (os_mbx_get_mbx_head__function_guard
  (os_mbx_get_mbx_head task_id os_task_mbx_rw1) task_id os_task_mbx_rw1))
  (=>
  (forall ((os_task_mbx_rw1 (Array Int us_rep1))) (oadd__function_guard
  (oadd (os_mbx_get_mbx_head task_id os_task_mbx_rw1) index)
  (os_mbx_get_mbx_head task_id os_task_mbx_rw1) index))
  (=> (in_range4
  (to_rep2
  (rec__test__os_mbx_entry_t__sender_id
  (us_split_fields1
  (select (rec__test__os_mbx_t__mbx_array
          (us_split_fields3 (select os_task_mbx_rw task_id))) (oadd
                                                              (os_mbx_get_mbx_head
                                                              task_id
                                                              os_task_mbx_rw)
                                                              index))))))
  (let ((o index))
  (let ((o1 task_id))
  (let ((o2 (os_mbx_get_mbx_head o1 os_task_mbx_rw)))
  (=>
  (and (os_mbx_get_mbx_head__function_guard o2 o1 os_task_mbx_rw)
  (and (dynamic_invariant1 o2 true false true true)
  (= o2 (to_rep
        (rec__test__os_mbx_t__head
        (us_split_fields3 (select os_task_mbx_rw o1)))))))
  (let ((o3 (oadd o2 o)))
  (=>
  (and (oadd__function_guard o3 o2 o)
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (let ((temp___340 (bvadd o2 (bvurem o ((_ int2bv 8) 256)))))
        (ite (bvule (bvsub #x03 o2) (bvurem o ((_ int2bv 8) 256)))
        (bvsub temp___340 #x03) temp___340)))))
  (forall ((o4 Int))
  (=>
  (= (to_rep2
     (rec__test__os_mbx_entry_t__sender_id
     (us_split_fields1
     (select (rec__test__os_mbx_t__mbx_array
             (us_split_fields3 (select os_task_mbx_rw task_id))) o3)))) o4)
  (in_range4 o4))))))))))))))))))
(check-sat)
(exit)
