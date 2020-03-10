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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort value 0)

(declare-fun valueqtint (value) Int)

;; value'axiom
  (assert
  (forall ((i value))
  (and (<= (- 2147483648) (valueqtint i)) (<= (valueqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (value value) Bool)

(declare-const dummy3 value)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content value)))))
(define-fun value__ref_value__content__projection ((a value__ref)) value 
  (value__content a))

(define-fun to_rep2 ((x value)) Int (valueqtint x))

(declare-fun of_rep2 (Int) value)

;; inversion_axiom
  (assert
  (forall ((x value))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x value)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int value))))))
(declare-fun slide ((Array Int value) Int Int) (Array Int value))

;; slide_eq
  (assert
  (forall ((a (Array Int value)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int value)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int value)) (a__first Int) (a__last Int)
  (b (Array Int value)) (b__first Int)
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
  (forall ((a (Array Int value)) (b (Array Int value)))
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
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int value))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int value) (elts a))

(define-fun of_array ((a (Array Int value)) (f Int)
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

(declare-datatypes ((values__ref 0))
(((values__refqtmk (values__content us_t)))))
(define-fun values__ref_values__content__projection ((a values__ref)) us_t 
  (values__content a))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__simple_unc_arrays__table__last natural)))))
(define-fun us_split_discrs_rec__simple_unc_arrays__table__last__projection ((a us_split_discrs)) natural 
  (rec__simple_unc_arrays__table__last a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__simple_unc_arrays__table__v us_t)))))
(define-fun us_split_fields_rec__simple_unc_arrays__table__v__projection ((a us_split_fields)) us_t 
  (rec__simple_unc_arrays__table__v a))

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
                           (rec__simple_unc_arrays__table__last
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__simple_unc_arrays__table__last
                                                  (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__simple_unc_arrays__table__v
                           (us_split_fields1 a))
                           (rec__simple_unc_arrays__table__v
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range5 ((rec__simple_unc_arrays__table__last1 Int)
  (a us_split_discrs)) Bool (= rec__simple_unc_arrays__table__last1 (to_rep
                                                                    (rec__simple_unc_arrays__table__last
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

(declare-const simple_unc_arrays__table__last__first__bit Int)

(declare-const simple_unc_arrays__table__last__last__bit Int)

(declare-const simple_unc_arrays__table__last__position Int)

;; simple_unc_arrays__table__last__first__bit_axiom
  (assert (<= 0 simple_unc_arrays__table__last__first__bit))

;; simple_unc_arrays__table__last__last__bit_axiom
  (assert
  (< simple_unc_arrays__table__last__first__bit simple_unc_arrays__table__last__last__bit))

;; simple_unc_arrays__table__last__position_axiom
  (assert (<= 0 simple_unc_arrays__table__last__position))

(declare-const simple_unc_arrays__table__v__first__bit Int)

(declare-const simple_unc_arrays__table__v__last__bit Int)

(declare-const simple_unc_arrays__table__v__position Int)

;; simple_unc_arrays__table__v__first__bit_axiom
  (assert (<= 0 simple_unc_arrays__table__v__first__bit))

;; simple_unc_arrays__table__v__last__bit_axiom
  (assert
  (< simple_unc_arrays__table__v__first__bit simple_unc_arrays__table__v__last__bit))

;; simple_unc_arrays__table__v__position_axiom
  (assert (<= 0 simple_unc_arrays__table__v__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((table__ref 0))
(((table__refqtmk (table__content us_rep)))))
(define-fun table__ref_table__content__projection ((a table__ref)) us_rep 
  (table__content a))

(declare-const a__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant2 ((temp___expr_199 us_rep)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (let ((temp___200 (rec__simple_unc_arrays__table__last
                                                       (us_split_discrs1
                                                       temp___expr_199))))
                                     (and (dynamic_property 1
                                     (to_rep temp___200)
                                     (first1
                                     (rec__simple_unc_arrays__table__v
                                     (us_split_fields1 temp___expr_199)))
                                     (last1
                                     (rec__simple_unc_arrays__table__v
                                     (us_split_fields1 temp___expr_199))))
                                     (and
                                     (= (first1
                                        (rec__simple_unc_arrays__table__v
                                        (us_split_fields1 temp___expr_199))) 1)
                                     (= (last1
                                        (rec__simple_unc_arrays__table__v
                                        (us_split_fields1 temp___expr_199))) 
                                     (to_rep temp___200))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r22b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((s21b__ref 0))
(((s21b__refqtmk (s21b__content us_t)))))
(define-fun s21b__ref_s21b__content__projection ((a s21b__ref)) us_t 
  (s21b__content a))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range4 temp___expr_186)))

(define-fun dynamic_invariant5 ((temp___expr_193 us_t)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (not (= temp___skip_constant_190 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_193)
                                     (last1 temp___expr_193))))

(define-fun dynamic_invariant6 ((temp___expr_361 us_t)
  (temp___is_init_357 Bool) (temp___skip_constant_358 Bool)
  (temp___do_toplevel_359 Bool)
  (temp___do_typ_inv_360 Bool)) Bool (=>
                                     (not (= temp___skip_constant_358 true))
                                     (and (dynamic_property 1 r22b
                                     (first1 temp___expr_361)
                                     (last1 temp___expr_361))
                                     (and (= (first1 temp___expr_361) 1)
                                     (= (last1 temp___expr_361) r22b)))))

(define-fun default_initial_assumption ((temp___expr_363 us_t)
  (temp___skip_top_level_364 Bool)) Bool (and (= (first1 temp___expr_363) 1)
                                         (= (last1 temp___expr_363) r22b)))

(assert
;; defqtvc
 ;; File "simple_unc_arrays.ads", line 28, characters 0-0
  (not
  (forall ((a__split_fields us_t) (low Int) (o Int) (high Int) (usf Int)
  (o1 Int))
  (=> (dynamic_invariant2
  (us_repqtmk a__split_discrs (us_split_fieldsqtmk a__split_fields)) true
  false true true)
  (=> (= low 1)
  (=> (dynamic_invariant1 low true false true true)
  (=> (= (to_rep (rec__simple_unc_arrays__table__last a__split_discrs)) o)
  (=> (= high o)
  (=> (dynamic_invariant high true false true true)
  (=> (< low high)
  (=>
  (exists ((o2 Int))
  (= (to_rep (rec__simple_unc_arrays__table__last a__split_discrs)) o2))
  (=>
  (= (and (ite (<= 1 usf) true false) (ite (<= usf (- low 1)) true false)) true)
  (=> (= (to_rep (rec__simple_unc_arrays__table__last a__split_discrs)) o1)
  (let ((o2 (+ (- o1 usf) 1)))
  (=> (in_range1 o2)
  (=> (and (<= (first1 a__split_fields) o2) (<= o2 (last1 a__split_fields)))
  (forall ((o3 Int))
  (=> (= (to_rep2 (select (to_array a__split_fields) o2)) o3)
  (<= (first1 a__split_fields) usf)))))))))))))))))))
(check-sat)
(exit)
