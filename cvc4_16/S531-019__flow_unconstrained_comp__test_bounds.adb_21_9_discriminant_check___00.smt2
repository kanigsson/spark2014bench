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

(declare-sort my_nat 0)

(declare-fun my_natqtint (my_nat) Int)

;; my_nat'axiom
  (assert
  (forall ((i my_nat)) (and (<= 0 (my_natqtint i)) (<= (my_natqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (my_nat my_nat) Bool)

(declare-const dummy my_nat)

(declare-datatypes ((my_nat__ref 0))
(((my_nat__refqtmk (my_nat__content my_nat)))))
(define-fun my_nat__ref_my_nat__content__projection ((a my_nat__ref)) my_nat 
  (my_nat__content a))

(define-fun to_rep ((x my_nat)) Int (my_natqtint x))

(declare-fun of_rep (Int) my_nat)

;; inversion_axiom
  (assert
  (forall ((x my_nat)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x my_nat)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun to_rep2 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep2 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test_bounds__my_t__x my_nat)))))
(define-fun us_split_discrs_rec__test_bounds__my_t__x__projection ((a us_split_discrs)) my_nat 
  (rec__test_bounds__my_t__x a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_bounds__my_t__content us_t)))))
(define-fun us_split_fields_rec__test_bounds__my_t__content__projection ((a us_split_fields)) us_t 
  (rec__test_bounds__my_t__content a))

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

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__test_bounds__my_t__x (us_split_discrs1 a))) 
                        (to_rep
                        (rec__test_bounds__my_t__x (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__test_bounds__my_t__content
                           (us_split_fields1 a))
                           (rec__test_bounds__my_t__content
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range5 ((rec__test_bounds__my_t__x1 Int)
  (a us_split_discrs)) Bool (= rec__test_bounds__my_t__x1 (to_rep
                                                          (rec__test_bounds__my_t__x
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

(declare-const test_bounds__my_t__x__first__bit Int)

(declare-const test_bounds__my_t__x__last__bit Int)

(declare-const test_bounds__my_t__x__position Int)

;; test_bounds__my_t__x__first__bit_axiom
  (assert (<= 0 test_bounds__my_t__x__first__bit))

;; test_bounds__my_t__x__last__bit_axiom
  (assert
  (< test_bounds__my_t__x__first__bit test_bounds__my_t__x__last__bit))

;; test_bounds__my_t__x__position_axiom
  (assert (<= 0 test_bounds__my_t__x__position))

(declare-const test_bounds__my_t__content__first__bit Int)

(declare-const test_bounds__my_t__content__last__bit Int)

(declare-const test_bounds__my_t__content__position Int)

;; test_bounds__my_t__content__first__bit_axiom
  (assert (<= 0 test_bounds__my_t__content__first__bit))

;; test_bounds__my_t__content__last__bit_axiom
  (assert
  (< test_bounds__my_t__content__first__bit test_bounds__my_t__content__last__bit))

;; test_bounds__my_t__content__position_axiom
  (assert (<= 0 test_bounds__my_t__content__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((my_t__ref 0))
(((my_t__refqtmk (my_t__content us_rep)))))
(define-fun my_t__ref_my_t__content__projection ((a my_t__ref)) us_rep 
  (my_t__content a))

(define-fun dynamic_invariant ((temp___expr_199 us_rep)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (let ((temp___200 (rec__test_bounds__my_t__x
                                                       (us_split_discrs1
                                                       temp___expr_199))))
                                     (and (dynamic_property 1
                                     (to_rep temp___200)
                                     (first1
                                     (rec__test_bounds__my_t__content
                                     (us_split_fields1 temp___expr_199)))
                                     (last1
                                     (rec__test_bounds__my_t__content
                                     (us_split_fields1 temp___expr_199))))
                                     (and
                                     (= (first1
                                        (rec__test_bounds__my_t__content
                                        (us_split_fields1 temp___expr_199))) 1)
                                     (= (last1
                                        (rec__test_bounds__my_t__content
                                        (us_split_fields1 temp___expr_199))) 
                                     (to_rep temp___200))))))

(define-fun default_initial_assumption ((temp___expr_202 us_rep)
  (temp___skip_top_level_203 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__test_bounds__my_t__x
                                            (us_split_discrs1
                                            temp___expr_202))) 0)
                                         (and
                                         (= (first1
                                            (rec__test_bounds__my_t__content
                                            (us_split_fields1
                                            temp___expr_202))) 1)
                                         (= (last1
                                            (rec__test_bounds__my_t__content
                                            (us_split_fields1
                                            temp___expr_202))) (to_rep
                                                               (rec__test_bounds__my_t__x
                                                               (us_split_discrs1
                                                               temp___expr_202)))))))

(declare-const x__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 0 100)) (in_range1 temp___expr_186)))

(declare-sort tT20bP1 0)

(declare-fun tT20bP1qtint (tT20bP1) Int)

;; tT20bP1'axiom
  (assert
  (forall ((i tT20bP1))
  (and (<= 1 (tT20bP1qtint i)) (<= (tT20bP1qtint i) 10))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (tT20bP1 tT20bP1) Bool)

(declare-const dummy6 tT20bP1)

(declare-datatypes ((tT20bP1__ref 0))
(((tT20bP1__refqtmk (tT20bP1__content tT20bP1)))))
(define-fun tT20bP1__ref_tT20bP1__content__projection ((a tT20bP1__ref)) tT20bP1 
  (tT20bP1__content a))

(declare-const dummy7 (Array Int natural))

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

(declare-fun user_eq7 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__test_bounds__my_t__content1 (Array Int natural))))))
(define-fun us_split_fields_rec__test_bounds__my_t__content__4__projection ((a us_split_fields2)) (Array Int natural) 
  (rec__test_bounds__my_t__content1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (of_array
                                         (rec__test_bounds__my_t__content1
                                         (us_split_fields3 a)) 1 10))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___158 (rec__test_bounds__my_t__content
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___158)))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__test_bounds__my_t__x (us_split_discrs2 a))) 
                         (to_rep
                         (rec__test_bounds__my_t__x (us_split_discrs2 b))))
                         (= (bool_eq
                            (rec__test_bounds__my_t__content1
                            (us_split_fields3 a)) 1 10
                            (rec__test_bounds__my_t__content1
                            (us_split_fields3 b)) 1 10) true))
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

(declare-const test_bounds__my_t__x__first__bit1 Int)

(declare-const test_bounds__my_t__x__last__bit1 Int)

(declare-const test_bounds__my_t__x__position1 Int)

;; test_bounds__my_t__x__first__bit_axiom
  (assert (<= 0 test_bounds__my_t__x__first__bit1))

;; test_bounds__my_t__x__last__bit_axiom
  (assert
  (< test_bounds__my_t__x__first__bit1 test_bounds__my_t__x__last__bit1))

;; test_bounds__my_t__x__position_axiom
  (assert (<= 0 test_bounds__my_t__x__position1))

(declare-const test_bounds__my_t__content__first__bit1 Int)

(declare-const test_bounds__my_t__content__last__bit1 Int)

(declare-const test_bounds__my_t__content__position1 Int)

;; test_bounds__my_t__content__first__bit_axiom
  (assert (<= 0 test_bounds__my_t__content__first__bit1))

;; test_bounds__my_t__content__last__bit_axiom
  (assert
  (< test_bounds__my_t__content__first__bit1 test_bounds__my_t__content__last__bit1))

;; test_bounds__my_t__content__position_axiom
  (assert (<= 0 test_bounds__my_t__content__position1))

(declare-fun user_eq8 (us_rep1 us_rep1) Bool)

(declare-const dummy8 us_rep1)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content us_rep1)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) us_rep1 
  (t19b__content a))

(declare-fun temp_____aggregate_def_218 (Int) (Array Int natural))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___220 Int))
  (=> (dynamic_invariant2 temp___220 true true true true)
  (forall ((temp___221 Int))
  (= (select (temp_____aggregate_def_218 temp___220) temp___221) rliteral)))))

(declare-const rliteral1 my_nat)

;; rliteral_axiom
  (assert (= (my_natqtint rliteral1) 10))

(assert
;; defqtvc
 ;; File "test_bounds.adb", line 16, characters 0-0
  (not
  (forall ((x__split_fields us_t) (x__split_discrs my_nat)
  (test_bounds__change_2__R17b__assume Int))
  (=> (dynamic_invariant
  (us_repqtmk (us_split_discrsqtmk x__split_discrs)
  (us_split_fieldsqtmk x__split_fields)) true false true true)
  (=> (not (= x__attr__constrained true))
  (=> (= (to_rep x__split_discrs) test_bounds__change_2__R17b__assume)
  (=> (= test_bounds__change_2__R17b__assume r17b)
  (=> (dynamic_invariant1 r17b true false true true)
  (=> (= x__attr__constrained true)
  (= (rec__test_bounds__my_t__x
     (us_split_discrs1
     (to_base
     (us_repqtmk1 (us_split_discrsqtmk rliteral1)
     (us_split_fieldsqtmk1 (temp_____aggregate_def_218 0)))))) x__split_discrs))))))))))
(check-sat)
(exit)
