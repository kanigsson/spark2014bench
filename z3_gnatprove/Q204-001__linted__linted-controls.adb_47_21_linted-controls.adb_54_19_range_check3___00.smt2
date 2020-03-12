(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
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

(declare-fun nth1 ((_ BitVec 32) Int) Bool)

(declare-fun lsr1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left2 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun to_int2 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv1 ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv1 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub1 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 32))))))
(declare-fun power1 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min1 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(declare-sort storage_element 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 8))

(declare-fun user_eq (storage_element storage_element) Bool)

(declare-const dummy storage_element)

(declare-datatypes ()
((storage_element__ref
 (storage_element__refqtmk (storage_element__content storage_element)))))
(define-fun storage_element__ref_storage_element__content__projection ((a storage_element__ref)) storage_element 
  (storage_element__content a))

(declare-fun to_rep (storage_element) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) storage_element)

;; inversion_axiom
  (assert
  (forall ((x storage_element))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int3 ((x storage_element)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x storage_element)) (! (uint_in_range
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int storage_element))))))
(declare-fun slide ((Array Int storage_element) Int
  Int) (Array Int storage_element))

;; slide_eq
  (assert
  (forall ((a (Array Int storage_element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int storage_element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int storage_element)) (a__first Int)
  (a__last Int) (b (Array Int storage_element)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int storage_element)) (b (Array Int storage_element)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const s (Array Int storage_element))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort int__ 0)

(declare-fun int__qtint (int__) Int)

;; int__'axiom
  (assert
  (forall ((i int__))
  (and (<= (- 2147483648) (int__qtint i)) (<= (int__qtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (int__ int__) Bool)

(declare-const dummy1 int__)

(declare-datatypes () ((int____ref (int____refqtmk (int____content int__)))))
(define-fun int____ref_int____content__projection ((a int____ref)) int__ 
  (int____content a))

(define-fun to_rep1 ((x int__)) Int (int__qtint x))

(declare-fun of_rep1 (Int) int__)

;; inversion_axiom
  (assert
  (forall ((x int__))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x int__)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__ada___linted__controls__packet__z_tilt int__)(rec__ada___linted__controls__packet__x_tilt int__)(rec__ada___linted__controls__packet__left Bool)(rec__ada___linted__controls__packet__right Bool)(rec__ada___linted__controls__packet__forward Bool)(rec__ada___linted__controls__packet__back Bool)(rec__ada___linted__controls__packet__jumping Bool)))))
(define-fun us_split_fields_rec__ada___linted__controls__packet__z_tilt__projection ((a us_split_fields)) int__ 
  (rec__ada___linted__controls__packet__z_tilt a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__x_tilt__projection ((a us_split_fields)) int__ 
  (rec__ada___linted__controls__packet__x_tilt a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__left__projection ((a us_split_fields)) Bool 
  (rec__ada___linted__controls__packet__left a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__right__projection ((a us_split_fields)) Bool 
  (rec__ada___linted__controls__packet__right a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__forward__projection ((a us_split_fields)) Bool 
  (rec__ada___linted__controls__packet__forward a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__back__projection ((a us_split_fields)) Bool 
  (rec__ada___linted__controls__packet__back a))

(define-fun us_split_fields_rec__ada___linted__controls__packet__jumping__projection ((a us_split_fields)) Bool 
  (rec__ada___linted__controls__packet__jumping a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep1
                           (rec__ada___linted__controls__packet__z_tilt
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___linted__controls__packet__z_tilt
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__ada___linted__controls__packet__x_tilt
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___linted__controls__packet__x_tilt
                                                  (us_split_fields1 b)))))
                        (and
                        (and
                        (and
                        (= (ite (rec__ada___linted__controls__packet__left
                                (us_split_fields1 a)) 1 0) (ite (rec__ada___linted__controls__packet__left
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__ada___linted__controls__packet__right
                                (us_split_fields1 a)) 1 0) (ite (rec__ada___linted__controls__packet__right
                                                                (us_split_fields1
                                                                b)) 1 0)))
                        (= (ite (rec__ada___linted__controls__packet__forward
                                (us_split_fields1 a)) 1 0) (ite (rec__ada___linted__controls__packet__forward
                                                                (us_split_fields1
                                                                b)) 1 0)))
                        (and
                        (= (ite (rec__ada___linted__controls__packet__back
                                (us_split_fields1 a)) 1 0) (ite (rec__ada___linted__controls__packet__back
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__ada___linted__controls__packet__jumping
                                (us_split_fields1 a)) 1 0) (ite (rec__ada___linted__controls__packet__jumping
                                                                (us_split_fields1
                                                                b)) 1 0)))))
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

(declare-const ada___linted__controls__packet__z_tilt__first__bit Int)

(declare-const ada___linted__controls__packet__z_tilt__last__bit Int)

(declare-const ada___linted__controls__packet__z_tilt__position Int)

;; ada___linted__controls__packet__z_tilt__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__z_tilt__first__bit))

;; ada___linted__controls__packet__z_tilt__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__z_tilt__first__bit ada___linted__controls__packet__z_tilt__last__bit))

;; ada___linted__controls__packet__z_tilt__position_axiom
  (assert (<= 0 ada___linted__controls__packet__z_tilt__position))

(declare-const ada___linted__controls__packet__x_tilt__first__bit Int)

(declare-const ada___linted__controls__packet__x_tilt__last__bit Int)

(declare-const ada___linted__controls__packet__x_tilt__position Int)

;; ada___linted__controls__packet__x_tilt__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__x_tilt__first__bit))

;; ada___linted__controls__packet__x_tilt__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__x_tilt__first__bit ada___linted__controls__packet__x_tilt__last__bit))

;; ada___linted__controls__packet__x_tilt__position_axiom
  (assert (<= 0 ada___linted__controls__packet__x_tilt__position))

(declare-const ada___linted__controls__packet__left__first__bit Int)

(declare-const ada___linted__controls__packet__left__last__bit Int)

(declare-const ada___linted__controls__packet__left__position Int)

;; ada___linted__controls__packet__left__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__left__first__bit))

;; ada___linted__controls__packet__left__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__left__first__bit ada___linted__controls__packet__left__last__bit))

;; ada___linted__controls__packet__left__position_axiom
  (assert (<= 0 ada___linted__controls__packet__left__position))

(declare-const ada___linted__controls__packet__right__first__bit Int)

(declare-const ada___linted__controls__packet__right__last__bit Int)

(declare-const ada___linted__controls__packet__right__position Int)

;; ada___linted__controls__packet__right__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__right__first__bit))

;; ada___linted__controls__packet__right__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__right__first__bit ada___linted__controls__packet__right__last__bit))

;; ada___linted__controls__packet__right__position_axiom
  (assert (<= 0 ada___linted__controls__packet__right__position))

(declare-const ada___linted__controls__packet__forward__first__bit Int)

(declare-const ada___linted__controls__packet__forward__last__bit Int)

(declare-const ada___linted__controls__packet__forward__position Int)

;; ada___linted__controls__packet__forward__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__forward__first__bit))

;; ada___linted__controls__packet__forward__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__forward__first__bit ada___linted__controls__packet__forward__last__bit))

;; ada___linted__controls__packet__forward__position_axiom
  (assert (<= 0 ada___linted__controls__packet__forward__position))

(declare-const ada___linted__controls__packet__back__first__bit Int)

(declare-const ada___linted__controls__packet__back__last__bit Int)

(declare-const ada___linted__controls__packet__back__position Int)

;; ada___linted__controls__packet__back__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__back__first__bit))

;; ada___linted__controls__packet__back__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__back__first__bit ada___linted__controls__packet__back__last__bit))

;; ada___linted__controls__packet__back__position_axiom
  (assert (<= 0 ada___linted__controls__packet__back__position))

(declare-const ada___linted__controls__packet__jumping__first__bit Int)

(declare-const ada___linted__controls__packet__jumping__last__bit Int)

(declare-const ada___linted__controls__packet__jumping__position Int)

;; ada___linted__controls__packet__jumping__first__bit_axiom
  (assert (<= 0 ada___linted__controls__packet__jumping__first__bit))

;; ada___linted__controls__packet__jumping__last__bit_axiom
  (assert
  (< ada___linted__controls__packet__jumping__first__bit ada___linted__controls__packet__jumping__last__bit))

;; ada___linted__controls__packet__jumping__position_axiom
  (assert (<= 0 ada___linted__controls__packet__jumping__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((packet__ref (packet__refqtmk (packet__content us_rep)))))
(define-fun packet__ref_packet__content__projection ((a packet__ref)) us_rep 
  (packet__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (and
                                         (and
                                         (= (to_rep1
                                            (rec__ada___linted__controls__packet__z_tilt
                                            (us_split_fields1
                                            temp___expr_172))) 0)
                                         (= (to_rep1
                                            (rec__ada___linted__controls__packet__x_tilt
                                            (us_split_fields1
                                            temp___expr_172))) 0))
                                         (and
                                         (and
                                         (and
                                         (= (rec__ada___linted__controls__packet__left
                                            (us_split_fields1
                                            temp___expr_172)) (distinct 0 0))
                                         (= (rec__ada___linted__controls__packet__right
                                            (us_split_fields1
                                            temp___expr_172)) (distinct 0 0)))
                                         (= (rec__ada___linted__controls__packet__forward
                                            (us_split_fields1
                                            temp___expr_172)) (distinct 0 0)))
                                         (and
                                         (= (rec__ada___linted__controls__packet__back
                                            (us_split_fields1
                                            temp___expr_172)) (distinct 0 0))
                                         (= (rec__ada___linted__controls__packet__jumping
                                            (us_split_fields1
                                            temp___expr_172)) (distinct 0 0))))))

(declare-const c11b (Array Int storage_element))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c38b (Array Int storage_element))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort tintB 0)

(declare-fun tintBqtint (tintB) Int)

;; tintB'axiom
  (assert
  (forall ((i tintB))
  (and (<= (- 2147483648) (tintBqtint i)) (<= (tintBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tintB tintB) Bool)

(declare-const dummy3 tintB)

(declare-datatypes () ((tintB__ref (tintB__refqtmk (tintB__content tintB)))))
(define-fun tintB__ref_tintB__content__projection ((a tintB__ref)) tintB 
  (tintB__content a))

(define-fun dynamic_invariant ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_164)))

(declare-sort tstorageP1 0)

(declare-fun tstorageP1qtint (tstorageP1) Int)

;; tstorageP1'axiom
  (assert
  (forall ((i tstorageP1))
  (and (<= 1 (tstorageP1qtint i)) (<= (tstorageP1qtint i) 9))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tstorageP1 tstorageP1) Bool)

(declare-const dummy4 tstorageP1)

(declare-datatypes ()
((tstorageP1__ref (tstorageP1__refqtmk (tstorageP1__content tstorageP1)))))
(define-fun tstorageP1__ref_tstorageP1__content__projection ((a tstorageP1__ref)) tstorageP1 
  (tstorageP1__content a))

(declare-sort nat 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 32))

(declare-fun user_eq5 (nat nat) Bool)

(declare-const dummy5 nat)

(declare-datatypes () ((nat__ref (nat__refqtmk (nat__content nat)))))
(define-fun nat__ref_nat__content__projection ((a nat__ref)) nat (nat__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_209 (_ BitVec 32))
  (temp___is_init_205 Bool) (temp___skip_constant_206 Bool)
  (temp___do_toplevel_207 Bool) (temp___do_typ_inv_208 Bool)) Bool true)

(declare-sort ttupleP1 0)

(declare-fun ttupleP1qtint (ttupleP1) Int)

;; ttupleP1'axiom
  (assert
  (forall ((i ttupleP1))
  (and (<= 1 (ttupleP1qtint i)) (<= (ttupleP1qtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (ttupleP1 ttupleP1) Bool)

(declare-const dummy6 ttupleP1)

(declare-datatypes ()
((ttupleP1__ref (ttupleP1__refqtmk (ttupleP1__content ttupleP1)))))
(define-fun ttupleP1__ref_ttupleP1__content__projection ((a ttupleP1__ref)) ttupleP1 
  (ttupleP1__content a))

(declare-sort t35b 0)

(declare-fun t35bqtint (t35b) Int)

;; t35b'axiom
  (assert
  (forall ((i t35b)) (and (<= 5 (t35bqtint i)) (<= (t35bqtint i) 8))))

(define-fun in_range5 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t35b t35b) Bool)

(declare-const dummy7 t35b)

(declare-datatypes () ((t35b__ref (t35b__refqtmk (t35b__content t35b)))))
(define-fun t35b__ref_t35b__content__projection ((a t35b__ref)) t35b 
  (t35b__content a))

(declare-sort t48b 0)

(declare-fun t48bqtint (t48b) Int)

;; t48b'axiom
  (assert
  (forall ((i t48b)) (and (<= 5 (t48bqtint i)) (<= (t48bqtint i) 8))))

(define-fun in_range6 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (t48b t48b) Bool)

(declare-const dummy8 t48b)

(declare-datatypes () ((t48b__ref (t48b__refqtmk (t48b__content t48b)))))
(define-fun t48b__ref_t48b__content__projection ((a t48b__ref)) t48b 
  (t48b__content a))

(declare-sort t52b 0)

(declare-fun t52bqtint (t52b) Int)

;; t52b'axiom
  (assert
  (forall ((i t52b)) (and (<= 5 (t52bqtint i)) (<= (t52bqtint i) 8))))

(define-fun in_range7 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (t52b t52b) Bool)

(declare-const dummy9 t52b)

(declare-datatypes () ((t52b__ref (t52b__refqtmk (t52b__content t52b)))))
(define-fun t52b__ref_t52b__content__projection ((a t52b__ref)) t52b 
  (t52b__content a))

(declare-sort t56b 0)

(declare-fun t56bqtint (t56b) Int)

;; t56b'axiom
  (assert
  (forall ((i t56b)) (and (<= 5 (t56bqtint i)) (<= (t56bqtint i) 8))))

(define-fun in_range8 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq10 (t56b t56b) Bool)

(declare-const dummy10 t56b)

(declare-datatypes () ((t56b__ref (t56b__refqtmk (t56b__content t56b)))))
(define-fun t56b__ref_t56b__content__projection ((a t56b__ref)) t56b 
  (t56b__content a))

(declare-sort t60b 0)

(declare-fun t60bqtint (t60b) Int)

;; t60b'axiom
  (assert
  (forall ((i t60b)) (and (<= 5 (t60bqtint i)) (<= (t60bqtint i) 8))))

(define-fun in_range9 ((x Int)) Bool (and (<= 5 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq11 (t60b t60b) Bool)

(declare-const dummy11 t60b)

(declare-datatypes () ((t60b__ref (t60b__refqtmk (t60b__content t60b)))))
(define-fun t60b__ref_t60b__content__projection ((a t60b__ref)) t60b 
  (t60b__content a))

(define-fun dynamic_invariant2 ((temp___expr_185 (_ BitVec 8))
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool) (temp___do_typ_inv_184 Bool)) Bool true)

;; c11b__def_axiom
  (assert (= c11b (let ((temp___156 4)) (let ((temp___155 1)) s))))

;; c38b__def_axiom
  (assert
  (= c38b (let ((temp___159 (let ((temp___158 8)) (let ((temp___157 5)) s))))
          (slide temp___159 5 1))))

(declare-const c__split_fields us_split_fields)

(declare-const x (_ BitVec 32))

(declare-const y Int)

(declare-const x1 (_ BitVec 32))

(declare-const y1 Int)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assert
  (assert
  (=> (<= 1 4) (and (and (<= 1 1) (<= 1 9)) (and (<= 1 4) (<= 4 9)))))

;; Assume
  (assert (= s c11b))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 x false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y false false true true))

;; Assert
  (assert
  (=> (<= 1 4) (and (and (<= 1 1) (<= 1 9)) (and (<= 1 4) (<= 4 9)))))

(declare-const o (_ BitVec 8))

;; Ensures
  (assert (= (to_rep (select s 1)) o))

;; Assert
  (assert
  (=> (<= 1 4) (and (and (<= 1 1) (<= 1 9)) (and (<= 1 4) (<= 4 9)))))

(declare-const o1 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep (select s 2)) o1))

;; Assert
  (assert
  (=> (<= 1 4) (and (and (<= 1 1) (<= 1 9)) (and (<= 1 4) (<= 4 9)))))

(declare-const o2 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep (select s 3)) o2))

;; Assert
  (assert
  (=> (<= 1 4) (and (and (<= 1 1) (<= 1 9)) (and (<= 1 4) (<= 4 9)))))

(declare-const o3 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep (select s 4)) o3))

(declare-const x2 (_ BitVec 32))

;; H
  (assert
  (= x2 (bvor (bvor (bvor ((_ zero_extend 24) o3) (bvshl ((_ zero_extend 24) 
  o2) ((_ int2bv 32) 8))) (bvshl ((_ zero_extend 24) o1) ((_ int2bv 32) 16))) (bvshl ((_ zero_extend 24) 
  o) ((_ int2bv 32) 24)))))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (bvule x2 #x7FFFFFFF) true false)))

;; H
  (assert (not (= spark__branch true)))

(define-fun o4 () Int (bv2int (bvnot x2)))

(assert
;; defqtvc
 ;; File "linted-controls.ads", line 37, characters 0-0
  (not (in_range1 o4)))
(check-sat)
