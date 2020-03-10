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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
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
  (forall ((a (Array Int integer)) (b (Array Int integer)))
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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort array_range 0)

(declare-fun array_rangeqtint (array_range) Int)

;; array_range'axiom
  (assert
  (forall ((i array_range))
  (and (<= 1 (array_rangeqtint i)) (<= (array_rangeqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (array_range array_range) Bool)

(declare-const dummy1 array_range)

(declare-datatypes ((array_range__ref 0))
(((array_range__refqtmk (array_range__content array_range)))))
(define-fun array_range__ref_array_range__content__projection ((a array_range__ref)) array_range 
  (array_range__content a))

(declare-sort t10b 0)

(declare-fun t10bqtint (t10b) Int)

;; t10b'axiom
  (assert
  (forall ((i t10b)) (and (<= 1 (t10bqtint i)) (<= (t10bqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t10b t10b) Bool)

(declare-const dummy2 t10b)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content t10b)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) t10b 
  (t10b__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 10)) (in_range2 temp___expr_160)))

(assert
;; defqtvc
 ;; File "s.ads", line 13, characters 0-0
  (not
  (forall ((dest (Array Int integer)) (src (Array Int integer)) (index Int)
  (temp___loop_entry_206 (Array Int integer))
  (temp___loop_entry_207 (Array Int integer)) (o Int) (o1 integer)
  (dest1 (Array Int integer)) (src1 (Array Int integer)) (index1 Int)
  (index2 Int) (o2 Int) (o3 integer) (dest2 (Array Int integer)) (j Int))
  (=> (= index 1)
  (=>
  (= (and (ite (<= 1 index) true false) (ite (<= index 10) true false)) true)
  (=> (= temp___loop_entry_206 src)
  (=> (= temp___loop_entry_207 src)
  (=> (= (to_rep (select src index)) o)
  (=> (= (to_rep o1) o)
  (=>
  (forall ((j1 Int))
  (=> (and (<= 1 j1) (<= j1 index1))
  (= (to_rep (select dest1 j1)) (to_rep (select temp___loop_entry_206 j1)))))
  (=>
  (forall ((j1 Int))
  (=> (and (<= (+ index1 1) j1) (<= j1 10))
  (= (to_rep (select src1 j1)) (to_rep (select temp___loop_entry_207 j1)))))
  (=>
  (= (and (ite (and
               (and
               (forall ((temp___201 Int))
               (=> (and (<= 1 temp___201) (<= temp___201 10))
               (=>
               (or (< 10 temp___201)
               (or (< temp___201 1) (< index1 temp___201)))
               (= (select dest1 temp___201) (select dest temp___201)))))
               (forall ((temp___203 Int))
               (=> (and (<= 1 temp___203) (<= temp___203 10))
               (=>
               (or (< 10 temp___203)
               (or (< temp___203 1) (< index1 temp___203)))
               (= (select src1 temp___203) (select src temp___203))))))
               (in_range3 index1))
          true false) (ite (and (<= 1 index1) (<= index1 10)) true false)) true)
  (=> (not (= index1 10))
  (=> (= index2 (+ index1 1))
  (=> (= (to_rep (select src1 index2)) o2)
  (=> (= (to_rep o3) o2)
  (=> (= dest2 (store dest1 index2 o3))
  (=> (<= 1 j)
  (=> (<= j index2)
  (= (to_rep (select dest2 j)) (to_rep (select temp___loop_entry_206 j))))))))))))))))))))))
(check-sat)
(exit)
