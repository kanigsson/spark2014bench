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

(declare-sort contents_type 0)

(declare-fun contents_typeqtint (contents_type) Int)

;; contents_type'axiom
  (assert
  (forall ((i contents_type))
  (and (<= (- 1000) (contents_typeqtint i)) (<= (contents_typeqtint i) 1000))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1000) x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (contents_type contents_type) Bool)

(declare-const dummy contents_type)

(declare-datatypes ((contents_type__ref 0))
(((contents_type__refqtmk (contents_type__content contents_type)))))
(define-fun contents_type__ref_contents_type__content__projection ((a contents_type__ref)) contents_type 
  (contents_type__content a))

(define-fun to_rep ((x contents_type)) Int (contents_typeqtint x))

(declare-fun of_rep (Int) contents_type)

;; inversion_axiom
  (assert
  (forall ((x contents_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x contents_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int contents_type))))))
(declare-fun slide ((Array Int contents_type) Int
  Int) (Array Int contents_type))

;; slide_eq
  (assert
  (forall ((a (Array Int contents_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int contents_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int contents_type)) (a__first Int)
  (a__last Int) (b (Array Int contents_type)) (b__first Int)
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
  (forall ((a (Array Int contents_type)) (b (Array Int contents_type)))
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

(declare-const arr (Array Int contents_type))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const l Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const u Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index_type index_type) Bool)

(declare-const dummy1 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 1 100)) (in_range2 temp___expr_169)))

(declare-sort tbase_index_typeB 0)

(declare-fun tbase_index_typeBqtint (tbase_index_typeB) Int)

;; tbase_index_typeB'axiom
  (assert
  (forall ((i tbase_index_typeB))
  (and (<= (- 128) (tbase_index_typeBqtint i))
  (<= (tbase_index_typeBqtint i) 127))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tbase_index_typeB tbase_index_typeB) Bool)

(declare-const dummy2 tbase_index_typeB)

(declare-datatypes ((tbase_index_typeB__ref 0))
(((tbase_index_typeB__refqtmk (tbase_index_typeB__content tbase_index_typeB)))))
(define-fun tbase_index_typeB__ref_tbase_index_typeB__content__projection ((a tbase_index_typeB__ref)) tbase_index_typeB 
  (tbase_index_typeB__content a))

(define-fun to_rep1 ((x tbase_index_typeB)) Int (tbase_index_typeBqtint x))

(declare-fun of_rep1 (Int) tbase_index_typeB)

;; inversion_axiom
  (assert
  (forall ((x tbase_index_typeB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tbase_index_typeB)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tbase_index_typeB tbase_index_typeB) Bool)

(declare-const dummy3 tbase_index_typeB)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content tbase_index_typeB)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) tbase_index_typeB 
  (t7b__content a))

(define-fun dynamic_invariant1 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= (- 1000) 1000)) (in_range1
                                     temp___expr_176)))

(assert
;; defqtvc
 ;; File "t3q5.adb", line 6, characters 0-0
  (not
  (forall ((k Int) (usf Int))
  (=> (dynamic_invariant l true false true true)
  (=> (dynamic_invariant u true false true true)
  (=> (<= 1 l)
  (=> (< l u)
  (=> (<= u 100)
  (=> (dynamic_invariant k false false true true)
  (=> (= (and (ite (<= l usf) true false) (ite (<= usf l) true false)) true)
  (<= 1 usf)))))))))))
(check-sat)
(exit)
