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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int Bool))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int Bool) (elts a))

(define-fun of_array ((a (Array Int Bool)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((a1__ref 0))
(((a1__refqtmk (a1__content us_t)))))
(define-fun a1__ref_a1__content__projection ((a a1__ref)) us_t (a1__content
                                                               a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__discr_init__r1__j integer)))))
(define-fun us_split_discrs_rec__discr_init__r1__j__projection ((a us_split_discrs)) integer 
  (rec__discr_init__r1__j a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__discr_init__r1__arr us_t)))))
(define-fun us_split_fields_rec__discr_init__r1__arr__projection ((a us_split_fields)) us_t 
  (rec__discr_init__r1__arr a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun discr_init__r1__arr__pred ((a us_rep)) Bool (and
                                                        (<= 1 (to_rep
                                                              (rec__discr_init__r1__j
                                                              (us_split_discrs1
                                                              a))))
                                                        (<= (to_rep
                                                            (rec__discr_init__r1__j
                                                            (us_split_discrs1
                                                            a))) 2147483647)))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__discr_init__r1__j (us_split_discrs1 a))) 
                        (to_rep
                        (rec__discr_init__r1__j (us_split_discrs1 b))))
                        (=> (discr_init__r1__arr__pred a)
                        (= (bool_eq1
                           (rec__discr_init__r1__arr (us_split_fields1 a))
                           (rec__discr_init__r1__arr (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range3 ((rec__discr_init__r1__j1 Int)
  (a us_split_discrs)) Bool (= rec__discr_init__r1__j1 (to_rep
                                                       (rec__discr_init__r1__j
                                                       a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr_init__r1__j__first__bit Int)

(declare-const discr_init__r1__j__last__bit Int)

(declare-const discr_init__r1__j__position Int)

;; discr_init__r1__j__first__bit_axiom
  (assert (<= 0 discr_init__r1__j__first__bit))

;; discr_init__r1__j__last__bit_axiom
  (assert (< discr_init__r1__j__first__bit discr_init__r1__j__last__bit))

;; discr_init__r1__j__position_axiom
  (assert (<= 0 discr_init__r1__j__position))

(declare-const discr_init__r1__arr__first__bit Int)

(declare-const discr_init__r1__arr__last__bit Int)

(declare-const discr_init__r1__arr__position Int)

;; discr_init__r1__arr__first__bit_axiom
  (assert (<= 0 discr_init__r1__arr__first__bit))

;; discr_init__r1__arr__last__bit_axiom
  (assert (< discr_init__r1__arr__first__bit discr_init__r1__arr__last__bit))

;; discr_init__r1__arr__position_axiom
  (assert (<= 0 discr_init__r1__arr__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((r1__ref 0))
(((r1__refqtmk (r1__content us_rep)))))
(define-fun r1__ref_r1__content__projection ((a r1__ref)) us_rep (r1__content
                                                                 a))

(declare-sort tT7bP1 0)

(declare-fun tT7bP1qtint (tT7bP1) Int)

;; tT7bP1'axiom
  (assert
  (forall ((i tT7bP1)) (and (<= 1 (tT7bP1qtint i)) (<= (tT7bP1qtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (tT7bP1 tT7bP1) Bool)

(declare-const dummy4 tT7bP1)

(declare-datatypes ((tT7bP1__ref 0))
(((tT7bP1__refqtmk (tT7bP1__content tT7bP1)))))
(define-fun tT7bP1__ref_tT7bP1__content__projection ((a tT7bP1__ref)) tT7bP1 
  (tT7bP1__content a))

(declare-const dummy5 (Array Int Bool))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 ((Array Int Bool) (Array Int Bool)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__discr_init__r1__arr1 (Array Int Bool))))))
(define-fun us_split_fields_rec__discr_init__r1__arr__2__projection ((a us_split_fields2)) (Array Int Bool) 
  (rec__discr_init__r1__arr1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (of_array
                                         (rec__discr_init__r1__arr1
                                         (us_split_fields3 a)) 1 10))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___155 (rec__discr_init__r1__arr
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___155)))))

(define-fun discr_init__r1__arr__pred1 ((a us_rep1)) Bool (and
                                                          (<= 1 (to_rep
                                                                (rec__discr_init__r1__j
                                                                (us_split_discrs2
                                                                a))))
                                                          (<= (to_rep
                                                              (rec__discr_init__r1__j
                                                              (us_split_discrs2
                                                              a))) 2147483647)))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__discr_init__r1__j (us_split_discrs2 a))) 
                         (to_rep
                         (rec__discr_init__r1__j (us_split_discrs2 b))))
                         (=> (discr_init__r1__arr__pred1 a)
                         (= (bool_eq
                            (rec__discr_init__r1__arr1 (us_split_fields3 a))
                            1 10
                            (rec__discr_init__r1__arr1 (us_split_fields3 b))
                            1 10) true)))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const discr_init__r1__j__first__bit1 Int)

(declare-const discr_init__r1__j__last__bit1 Int)

(declare-const discr_init__r1__j__position1 Int)

;; discr_init__r1__j__first__bit_axiom
  (assert (<= 0 discr_init__r1__j__first__bit1))

;; discr_init__r1__j__last__bit_axiom
  (assert (< discr_init__r1__j__first__bit1 discr_init__r1__j__last__bit1))

;; discr_init__r1__j__position_axiom
  (assert (<= 0 discr_init__r1__j__position1))

(declare-const discr_init__r1__arr__first__bit1 Int)

(declare-const discr_init__r1__arr__last__bit1 Int)

(declare-const discr_init__r1__arr__position1 Int)

;; discr_init__r1__arr__first__bit_axiom
  (assert (<= 0 discr_init__r1__arr__first__bit1))

;; discr_init__r1__arr__last__bit_axiom
  (assert
  (< discr_init__r1__arr__first__bit1 discr_init__r1__arr__last__bit1))

;; discr_init__r1__arr__position_axiom
  (assert (<= 0 discr_init__r1__arr__position1))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((r2__ref 0))
(((r2__refqtmk (r2__content us_rep1)))))
(define-fun r2__ref_r2__content__projection ((a r2__ref)) us_rep1 (r2__content
                                                                  a))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

(declare-fun temp_____aggregate_def_200 (Bool Int Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_194 us_rep1)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (not (= temp___skip_constant_191 true))
                                     (in_range3 10
                                     (us_split_discrs1
                                     (to_base temp___expr_194)))))

(define-fun default_initial_assumption ((temp___expr_197 us_rep1)
  (temp___skip_top_level_198 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__discr_init__r1__j
                                            (us_split_discrs2
                                            temp___expr_197))) 10)
                                         (=> (discr_init__r1__arr__pred1
                                         temp___expr_197)
                                         (= (rec__discr_init__r1__arr1
                                            (us_split_fields3
                                            temp___expr_197)) (let ((temp___206 
                                                              (temp_____aggregate_def_200
                                                              (distinct 1 0)
                                                              1
                                                              (to_rep
                                                              (rec__discr_init__r1__j
                                                              (us_split_discrs2
                                                              temp___expr_197))))))
                                                              (to_array
                                                              temp___206))))))

(declare-const y__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_181 us_t)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_181)
                                     (last1 temp___expr_181))))

(define-fun dynamic_invariant4 ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (let ((temp___188 (rec__discr_init__r1__j
                                                       (us_split_discrs1
                                                       temp___expr_187))))
                                     (=> (discr_init__r1__arr__pred
                                     temp___expr_187)
                                     (and (dynamic_property 1
                                     (to_rep temp___188)
                                     (first1
                                     (rec__discr_init__r1__arr
                                     (us_split_fields1 temp___expr_187)))
                                     (last1
                                     (rec__discr_init__r1__arr
                                     (us_split_fields1 temp___expr_187))))
                                     (and
                                     (= (first1
                                        (rec__discr_init__r1__arr
                                        (us_split_fields1 temp___expr_187))) 1)
                                     (= (last1
                                        (rec__discr_init__r1__arr
                                        (us_split_fields1 temp___expr_187))) 
                                     (to_rep temp___188)))))))

;; def_axiom
  (assert
  (forall ((temp___202 Bool))
  (forall ((temp___203 Int) (temp___204 Int))
  (let ((temp___201 (temp_____aggregate_def_200 temp___202 temp___203
                    temp___204)))
  (and
  (=> (dynamic_property 0 2147483647 temp___203 temp___204)
  (and (= (first1 temp___201) temp___203) (= (last1 temp___201) temp___204)))
  (forall ((temp___205 Int))
  (= (select (to_array temp___201) temp___205) temp___202)))))))

(assert
;; defqtvc
 ;; File "discr_init.adb", line 1, characters 0-0
  (not
  (=>
  (exists ((usf Int))
  (and (dynamic_invariant usf true true true true)
  (exists ((usf1 us_rep))
  (= (to_rep (rec__discr_init__r1__j (us_split_discrs1 usf1))) usf))))
  (in_range1 10))))
(check-sat)
(exit)
