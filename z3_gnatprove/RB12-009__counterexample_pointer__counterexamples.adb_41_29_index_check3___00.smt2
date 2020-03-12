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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__counterexamples__string_access__is_null_pointer Bool)(rec__counterexamples__string_access__pointer_address Int)(rec__counterexamples__string_access__pointer_value us_t)))))
(define-fun us_rep_rec__counterexamples__string_access__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__counterexamples__string_access__is_null_pointer a))

(define-fun us_rep_rec__counterexamples__string_access__pointer_address__projection ((a us_rep)) Int 
  (rec__counterexamples__string_access__pointer_address a))

(define-fun us_rep_rec__counterexamples__string_access__pointer_value__projection ((a us_rep)) us_t 
  (rec__counterexamples__string_access__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__counterexamples__string_access__is_null_pointer
                           a) (rec__counterexamples__string_access__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__counterexamples__string_access__is_null_pointer
                           a) true))
                        (and
                        (= (rec__counterexamples__string_access__pointer_address
                           a) (rec__counterexamples__string_access__pointer_address
                              b))
                        (= (rec__counterexamples__string_access__pointer_value
                           a) (rec__counterexamples__string_access__pointer_value
                              b)))))
                   true false))

(define-fun rec__counterexamples__string_access__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__counterexamples__string_access__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__counterexamples__string_access__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep)

(declare-datatypes ()
((string_access__ref
 (string_access__refqtmk (string_access__content us_rep)))))
(define-fun string_access__ref_string_access__content__projection ((a string_access__ref)) us_rep 
  (string_access__content a))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int us_rep))))))
(declare-fun slide1 ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq2 (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq2 (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first2 (mk1 f l))) f)
     (= (to_rep1 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int us_rep))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int us_rep) (elts1 a))

(define-fun of_array1 ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep1 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep1 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq4 ((x us_t1)
  (y us_t1)) Bool (bool_eq3 (elts1 x) (to_rep1 (first2 (rt1 x)))
                  (to_rep1 (last2 (rt1 x))) (elts1 y)
                  (to_rep1 (first2 (rt1 y))) (to_rep1 (last2 (rt1 y)))))

(declare-fun user_eq4 (us_t1 us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes ()
((string_array__ref (string_array__refqtmk (string_array__content us_t1)))))
(define-fun string_array__ref_string_array__content__projection ((a string_array__ref)) us_t1 
  (string_array__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_176 us_rep)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (not
                                     (= (rec__counterexamples__string_access__is_null_pointer
                                        temp___expr_176) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__counterexamples__string_access__pointer_value
                                     temp___expr_176))
                                     (last1
                                     (rec__counterexamples__string_access__pointer_value
                                     temp___expr_176)))))

(define-fun default_initial_assumption ((temp___expr_178 us_rep)
  (temp___skip_top_level_179 Bool)) Bool (= (rec__counterexamples__string_access__is_null_pointer
                                            temp___expr_178) true))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (rec__counterexamples__string_array_access__is_null_pointer Bool)(rec__counterexamples__string_array_access__pointer_address Int)(rec__counterexamples__string_array_access__pointer_value us_t1)))))
(define-fun us_rep_rec__counterexamples__string_array_access__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__counterexamples__string_array_access__is_null_pointer a))

(define-fun us_rep_rec__counterexamples__string_array_access__pointer_address__projection ((a us_rep1)) Int 
  (rec__counterexamples__string_array_access__pointer_address a))

(define-fun us_rep_rec__counterexamples__string_array_access__pointer_value__projection ((a us_rep1)) us_t1 
  (rec__counterexamples__string_array_access__pointer_value a))

(declare-datatypes ()
((us_rep__ref1 (us_rep__refqtmk1 (us_rep__content1 us_rep1)))))
(define-fun us_rep__ref___rep__content__4__projection ((a us_rep__ref1)) us_rep1 
  (us_rep__content1 a))

(define-fun bool_eq5 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__counterexamples__string_array_access__is_null_pointer
                            a) (rec__counterexamples__string_array_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__counterexamples__string_array_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__counterexamples__string_array_access__pointer_address
                            a) (rec__counterexamples__string_array_access__pointer_address
                               b))
                         (= (rec__counterexamples__string_array_access__pointer_value
                            a) (rec__counterexamples__string_array_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__counterexamples__string_array_access__pointer_value__pred ((a us_rep1)) Bool 
  (not
  (= (rec__counterexamples__string_array_access__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__counterexamples__string_array_access__is_null_pointer
     us_null_pointer1) true))

(declare-const dummy6 us_rep1)

(declare-datatypes ()
((string_array_access__ref
 (string_array_access__refqtmk (string_array_access__content us_rep1)))))
(define-fun string_array_access__ref_string_array_access__content__projection ((a string_array_access__ref)) us_rep1 
  (string_array_access__content a))

(define-fun dynamic_invariant1 ((temp___expr_205 us_rep1)
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (=>
                                     (not
                                     (= (rec__counterexamples__string_array_access__is_null_pointer
                                        temp___expr_205) true))
                                     (and (dynamic_property1 1 2147483647
                                     (first3
                                     (rec__counterexamples__string_array_access__pointer_value
                                     temp___expr_205))
                                     (last3
                                     (rec__counterexamples__string_array_access__pointer_value
                                     temp___expr_205)))
                                     (forall ((temp___206 Int))
                                     (=>
                                     (and
                                     (<= (first3
                                         (rec__counterexamples__string_array_access__pointer_value
                                         temp___expr_205)) temp___206)
                                     (<= temp___206 (last3
                                                    (rec__counterexamples__string_array_access__pointer_value
                                                    temp___expr_205))))
                                     (=>
                                     (not
                                     (= (rec__counterexamples__string_access__is_null_pointer
                                        (select (to_array1
                                                (rec__counterexamples__string_array_access__pointer_value
                                                temp___expr_205)) temp___206)) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__counterexamples__string_access__pointer_value
                                     (select (to_array1
                                             (rec__counterexamples__string_array_access__pointer_value
                                             temp___expr_205)) temp___206)))
                                     (last1
                                     (rec__counterexamples__string_access__pointer_value
                                     (select (to_array1
                                             (rec__counterexamples__string_array_access__pointer_value
                                             temp___expr_205)) temp___206))))))))))

(define-fun default_initial_assumption1 ((temp___expr_208 us_rep1)
  (temp___skip_top_level_209 Bool)) Bool (= (rec__counterexamples__string_array_access__is_null_pointer
                                            temp___expr_208) true))

(declare-sort t15b 0)

(declare-fun t15bqtint (t15b) Int)

;; t15b'axiom
  (assert
  (forall ((i t15b)) (and (<= 1 (t15bqtint i)) (<= (t15bqtint i) 1))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (t15b t15b) Bool)

(declare-const dummy7 t15b)

(declare-datatypes () ((t15b__ref (t15b__refqtmk (t15b__content t15b)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) t15b 
  (t15b__content a))

(declare-fun temp___String_Literal_214 (tuple0) (Array Int character))

;; temp___String_Literal_214__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_214 us_void_param) 1)) 119)
     (= (to_rep (select (temp___String_Literal_214 us_void_param) 2)) 111))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_214 us_void_param) 3)) 114)
     (= (to_rep (select (temp___String_Literal_214 us_void_param) 4)) 108))
     (= (to_rep (select (temp___String_Literal_214 us_void_param) 5)) 100))) :pattern (
  (temp___String_Literal_214 us_void_param)) )))

(declare-fun temp_____aggregate_def_215 (us_rep) (Array Int us_rep))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

(define-fun dynamic_invariant4 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant6 ((temp___expr_184 us_t1)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_181 true))
                                     (dynamic_property1 1 2147483647
                                     (first3 temp___expr_184)
                                     (last3 temp___expr_184)))
                                     (forall ((temp___185 Int))
                                     (=>
                                     (and
                                     (<= (first3 temp___expr_184) temp___185)
                                     (<= temp___185 (last3 temp___expr_184)))
                                     (=>
                                     (not
                                     (= (rec__counterexamples__string_access__is_null_pointer
                                        (select (to_array1 temp___expr_184) temp___185)) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__counterexamples__string_access__pointer_value
                                     (select (to_array1 temp___expr_184) temp___185)))
                                     (last1
                                     (rec__counterexamples__string_access__pointer_value
                                     (select (to_array1 temp___expr_184) temp___185)))))))))

;; def_axiom
  (assert
  (forall ((temp___217 us_rep))
  (=> (dynamic_invariant temp___217 true true true true)
  (= (select (temp_____aggregate_def_215 temp___217) 1) temp___217))))

(declare-const us_next_pointer_address Int)

(declare-const counterexamples__bad_4__w__assume us_rep)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__counterexamples__string_access__is_null_pointer
                  counterexamples__bad_4__w__assume) true))
               (= (rec__counterexamples__string_access__pointer_address
                  counterexamples__bad_4__w__assume) us_next_pointer_address))
          true false) (ite (= (rec__counterexamples__string_access__pointer_value
                              counterexamples__bad_4__w__assume) (of_array
                                                                 (temp___String_Literal_214
                                                                 Tuple0) 1 5))
                      true false)) true))

(declare-const w__pointer_value us_t)

;; H
  (assert
  (= w__pointer_value (rec__counterexamples__string_access__pointer_value
                      counterexamples__bad_4__w__assume)))

(declare-const w__pointer_address Int)

;; H
  (assert
  (= w__pointer_address (rec__counterexamples__string_access__pointer_address
                        counterexamples__bad_4__w__assume)))

(declare-const w__is_null_pointer Bool)

;; H
  (assert
  (= w__is_null_pointer (rec__counterexamples__string_access__is_null_pointer
                        counterexamples__bad_4__w__assume)))

;; Assume
  (assert (dynamic_invariant
  (us_repqtmk w__is_null_pointer w__pointer_address w__pointer_value) true
  false true true))

(declare-const us_next_pointer_address1 Int)

(declare-const counterexamples__bad_4__a__assume us_rep1)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__counterexamples__string_array_access__is_null_pointer
                  counterexamples__bad_4__a__assume) true))
               (= (rec__counterexamples__string_array_access__pointer_address
                  counterexamples__bad_4__a__assume) us_next_pointer_address1))
          true false) (ite (= (rec__counterexamples__string_array_access__pointer_value
                              counterexamples__bad_4__a__assume) (of_array1
                                                                 (temp_____aggregate_def_215
                                                                 (us_repqtmk
                                                                 w__is_null_pointer
                                                                 w__pointer_address
                                                                 w__pointer_value))
                                                                 1 1))
                      true false)) true))

(declare-const a__pointer_value us_t1)

;; H
  (assert
  (= a__pointer_value (rec__counterexamples__string_array_access__pointer_value
                      counterexamples__bad_4__a__assume)))

(declare-const a__pointer_address Int)

;; H
  (assert
  (= a__pointer_address (rec__counterexamples__string_array_access__pointer_address
                        counterexamples__bad_4__a__assume)))

(declare-const a__is_null_pointer Bool)

;; H
  (assert
  (= a__is_null_pointer (rec__counterexamples__string_array_access__is_null_pointer
                        counterexamples__bad_4__a__assume)))

;; Assume
  (assert (dynamic_invariant1
  (us_repqtmk1 a__is_null_pointer a__pointer_address a__pointer_value) true
  false true true))

;; Assert
  (assert
  (and (<= (first3 a__pointer_value) 1) (<= 1 (last3 a__pointer_value))))

(define-fun o () us_rep (select (to_array1 a__pointer_value) 1))

(define-fun temp___221 () us_t (rec__counterexamples__string_access__pointer_value
                               o))

(assert
;; defqtvc
 ;; File "counterexamples.adb", line 37, characters 0-0
  (not (<= (first1 temp___221) 3)))
(check-sat)
