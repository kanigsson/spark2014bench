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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

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

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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
                           (= (to_rep (select a temp___idx_154)) (to_rep
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
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const au__first integer)

(declare-const au__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const ad__first integer)

(declare-const ad__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test_globals__my_rec__d natural)))))
(define-fun us_split_discrs_rec__test_globals__my_rec__d__projection ((a us_split_discrs)) natural 
  (rec__test_globals__my_rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_globals__my_rec__f natural)))))
(define-fun us_split_fields_rec__test_globals__my_rec__f__projection ((a us_split_fields)) natural 
  (rec__test_globals__my_rec__f a))

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

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__test_globals__my_rec__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__test_globals__my_rec__d
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__test_globals__my_rec__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test_globals__my_rec__f
                                                  (us_split_fields1 b)))))
                   true false))

(define-fun in_range3 ((rec__test_globals__my_rec__d1 Int)
  (a us_split_discrs)) Bool (= rec__test_globals__my_rec__d1 (to_rep
                                                             (rec__test_globals__my_rec__d
                                                             a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_globals__my_rec__d__first__bit Int)

(declare-const test_globals__my_rec__d__last__bit Int)

(declare-const test_globals__my_rec__d__position Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit test_globals__my_rec__d__last__bit))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position))

(declare-const test_globals__my_rec__f__first__bit Int)

(declare-const test_globals__my_rec__f__last__bit Int)

(declare-const test_globals__my_rec__f__position Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit test_globals__my_rec__f__last__bit))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep 
  (my_rec__content a))

(declare-const ru__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_globals__my_rec__d__first__bit1 Int)

(declare-const test_globals__my_rec__d__last__bit1 Int)

(declare-const test_globals__my_rec__d__position1 Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit1))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit1 test_globals__my_rec__d__last__bit1))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position1))

(declare-const test_globals__my_rec__f__first__bit1 Int)

(declare-const test_globals__my_rec__f__last__bit1 Int)

(declare-const test_globals__my_rec__f__position1 Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit1))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit1 test_globals__my_rec__f__last__bit1))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((my_rec_stat__ref 0))
(((my_rec_stat__refqtmk (my_rec_stat__content us_rep)))))
(define-fun my_rec_stat__ref_my_rec_stat__content__projection ((a my_rec_stat__ref)) us_rep 
  (my_rec_stat__content a))

(declare-const rs__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant1 ((temp___expr_192 us_rep)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (not (= temp___skip_constant_189 true))
                                     (in_range3 100
                                     (us_split_discrs1 temp___expr_192))))

(define-fun default_initial_assumption ((temp___expr_194 us_rep)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep
                                            (rec__test_globals__my_rec__d
                                            (us_split_discrs1
                                            temp___expr_194))) 100))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test_globals__my_rec__d__first__bit2 Int)

(declare-const test_globals__my_rec__d__last__bit2 Int)

(declare-const test_globals__my_rec__d__position2 Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit2))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit2 test_globals__my_rec__d__last__bit2))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position2))

(declare-const test_globals__my_rec__f__first__bit2 Int)

(declare-const test_globals__my_rec__f__last__bit2 Int)

(declare-const test_globals__my_rec__f__position2 Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit2))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit2 test_globals__my_rec__f__last__bit2))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((my_rec_dyn__ref 0))
(((my_rec_dyn__refqtmk (my_rec_dyn__content us_rep)))))
(define-fun my_rec_dyn__ref_my_rec_dyn__content__projection ((a my_rec_dyn__ref)) us_rep 
  (my_rec_dyn__content a))

(declare-const rd__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_202 us_rep)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (=>
                                     (not (= temp___skip_constant_199 true))
                                     (in_range3 c
                                     (us_split_discrs1 temp___expr_202))))

(define-fun default_initial_assumption1 ((temp___expr_204 us_rep)
  (temp___skip_top_level_205 Bool)) Bool (= (to_rep
                                            (rec__test_globals__my_rec__d
                                            (us_split_discrs1
                                            temp___expr_204))) c))

(declare-fun nested_with_globals (us_split_fields (Array Int natural)
  us_split_fields (Array Int natural) us_split_fields
  (Array Int natural)) Bool)

(declare-fun nested_with_globals__function_guard (Bool us_split_fields
  (Array Int natural) us_split_fields (Array Int natural) us_split_fields
  (Array Int natural)) Bool)

;; nested_with_globals__post_axiom
  (assert true)

;; nested_with_globals__def_axiom
  (assert
  (forall ((test_globals__ru__fields us_split_fields))
  (forall ((test_globals__au (Array Int natural))
  (test_globals__as (Array Int natural))
  (test_globals__ad (Array Int natural)))
  (forall ((test_globals__rs__fields us_split_fields))
  (forall ((test_globals__rd__fields us_split_fields))
  (! (=
     (= (nested_with_globals test_globals__ru__fields test_globals__au
        test_globals__rs__fields test_globals__as test_globals__rd__fields
        test_globals__ad) true)
     (ite (< 0 c)
     (and
     (and (= (to_rep (select test_globals__au 1)) 0)
     (= (to_rep (select test_globals__as 1)) 0))
     (= (to_rep (select test_globals__ad 1)) 0))
     (and
     (and
     (= (to_rep
        (rec__test_globals__my_rec__f
        (us_split_fields1
        (us_repqtmk ru__split_discrs test_globals__ru__fields)))) 0)
     (= (to_rep
        (rec__test_globals__my_rec__f
        (us_split_fields1
        (us_repqtmk rs__split_discrs test_globals__rs__fields)))) 0))
     (= (to_rep
        (rec__test_globals__my_rec__f
        (us_split_fields1
        (us_repqtmk rd__split_discrs test_globals__rd__fields)))) 0)))) :pattern (
  (nested_with_globals test_globals__ru__fields test_globals__au
  test_globals__rs__fields test_globals__as test_globals__rd__fields
  test_globals__ad)) ))))))

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
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-datatypes ((my_array_dyn__ref 0))
(((my_array_dyn__refqtmk (my_array_dyn__content us_t)))))
(define-fun my_array_dyn__ref_my_array_dyn__content__projection ((a my_array_dyn__ref)) us_t 
  (my_array_dyn__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_t)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_t (t8b__content
                                                                  a))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const test_globals__my_rec__d__first__bit3 Int)

(declare-const test_globals__my_rec__d__last__bit3 Int)

(declare-const test_globals__my_rec__d__position3 Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit3))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit3 test_globals__my_rec__d__last__bit3))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position3))

(declare-const test_globals__my_rec__f__first__bit3 Int)

(declare-const test_globals__my_rec__f__last__bit3 Int)

(declare-const test_globals__my_rec__f__position3 Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit3))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit3 test_globals__my_rec__f__last__bit3))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position3))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content us_rep)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) us_rep (t9b__content
                                                                    a))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const test_globals__my_rec__d__first__bit4 Int)

(declare-const test_globals__my_rec__d__last__bit4 Int)

(declare-const test_globals__my_rec__d__position4 Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit4))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit4 test_globals__my_rec__d__last__bit4))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position4))

(declare-const test_globals__my_rec__f__first__bit4 Int)

(declare-const test_globals__my_rec__f__last__bit4 Int)

(declare-const test_globals__my_rec__f__position4 Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit4))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit4 test_globals__my_rec__f__last__bit4))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position4))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_rep)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_rep 
  (t10b__content a))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const alignment6 Int)

;; value__size_axiom
  (assert (<= 0 value__size6))

;; object__size_axiom
  (assert (<= 0 object__size6))

;; alignment_axiom
  (assert (<= 0 alignment6))

(declare-const test_globals__my_rec__d__first__bit5 Int)

(declare-const test_globals__my_rec__d__last__bit5 Int)

(declare-const test_globals__my_rec__d__position5 Int)

;; test_globals__my_rec__d__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__d__first__bit5))

;; test_globals__my_rec__d__last__bit_axiom
  (assert
  (< test_globals__my_rec__d__first__bit5 test_globals__my_rec__d__last__bit5))

;; test_globals__my_rec__d__position_axiom
  (assert (<= 0 test_globals__my_rec__d__position5))

(declare-const test_globals__my_rec__f__first__bit5 Int)

(declare-const test_globals__my_rec__f__last__bit5 Int)

(declare-const test_globals__my_rec__f__position5 Int)

;; test_globals__my_rec__f__first__bit_axiom
  (assert (<= 0 test_globals__my_rec__f__first__bit5))

;; test_globals__my_rec__f__last__bit_axiom
  (assert
  (< test_globals__my_rec__f__first__bit5 test_globals__my_rec__f__last__bit5))

;; test_globals__my_rec__f__position_axiom
  (assert (<= 0 test_globals__my_rec__f__position5))

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_rep)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_rep 
  (t11b__content a))

(declare-fun test_globals__au__aggregate_def (Int Int Int) us_t)

(declare-fun test_globals__as__aggregate_def (Int) (Array Int natural))

(declare-fun test_globals__ad__aggregate_def (Int Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_160 us_t)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (not (= temp___skip_constant_157 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_160)
                                     (last1 temp___expr_160))))

(define-fun dynamic_invariant5 ((temp___expr_176 us_t)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (not (= temp___skip_constant_173 true))
                                     (and (dynamic_property 1 c
                                     (first1 temp___expr_176)
                                     (last1 temp___expr_176))
                                     (and (= (first1 temp___expr_176) 1)
                                     (= (last1 temp___expr_176) c)))))

(define-fun default_initial_assumption2 ((temp___expr_178 us_t)
  (temp___skip_top_level_179 Bool)) Bool (and (= (first1 temp___expr_178) 1)
                                         (= (last1 temp___expr_178) c)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___227 Int) (temp___228 Int) (temp___229 Int))
  (let ((temp___226 (test_globals__au__aggregate_def temp___227 temp___228
                    temp___229)))
  (=> (dynamic_invariant temp___227 true true true true)
  (and
  (=> (dynamic_property 0 2147483647 temp___228 temp___229)
  (and (= (first1 temp___226) temp___228) (= (last1 temp___226) temp___229)))
  (forall ((temp___230 Int))
  (= (select (to_array temp___226) temp___230) rliteral)))))))

;; def_axiom
  (assert
  (forall ((temp___235 Int))
  (=> (dynamic_invariant temp___235 true true true true)
  (forall ((temp___236 Int))
  (= (select (test_globals__as__aggregate_def temp___235) temp___236) 
  rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___238 Int) (temp___239 Int) (temp___240 Int))
  (let ((temp___237 (test_globals__ad__aggregate_def temp___238 temp___239
                    temp___240)))
  (=> (dynamic_invariant temp___238 true true true true)
  (and
  (=> (dynamic_property 0 2147483647 temp___239 temp___240)
  (and (= (first1 temp___237) temp___239) (= (last1 temp___237) temp___240)))
  (forall ((temp___241 Int))
  (= (select (to_array temp___237) temp___241) rliteral)))))))

(assert
;; defqtvc
 ;; File "test_globals.adb", line 1, characters 0-0
  (not
  (=> (dynamic_invariant c true false true true)
  (=> (in_range1 100) (in_range1 c)))))
(check-sat)
(exit)
