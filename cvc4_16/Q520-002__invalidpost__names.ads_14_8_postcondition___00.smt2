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

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(define-fun dynamic_invariant ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
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
(((us_tqtmk (elts (Array Int character))(rt t)))))
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

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant1 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-const name us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_letter (Int) Bool)

(declare-fun is_letter__function_guard (Bool Int) Bool)

;; is_letter__post_axiom
  (assert true)

(declare-fun is_digit (Int) Bool)

(declare-fun is_digit__function_guard (Bool Int) Bool)

;; is_digit__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort state_type 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (state_type state_type) Bool)

(declare-const dummy4 state_type)

(declare-datatypes ((state_type__ref 0))
(((state_type__refqtmk (state_type__content state_type)))))
(define-fun state_type__ref_state_type__content__projection ((a state_type__ref)) state_type 
  (state_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 2)) (in_range4 temp___expr_187)))

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 255))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (length_type length_type) Bool)

(declare-const dummy5 length_type)

(declare-datatypes ((length_type__ref 0))
(((length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= 0 255)) (in_range5 temp___expr_194)))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content integer)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) integer 
  (t3b__content a))

(declare-sort iso_646 0)

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (iso_646 iso_646) Bool)

(declare-const dummy7 iso_646)

(declare-datatypes ((iso_646__ref 0))
(((iso_646__refqtmk (iso_646__content iso_646)))))
(define-fun iso_646__ref_iso_646__content__projection ((a iso_646__ref)) iso_646 
  (iso_646__content a))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant6 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= 0 127)) (in_range6 temp___expr_201)))

(assert
;; defqtvc
 ;; File "names.ads", line 12, characters 0-0
  (not
  (forall ((state Int) (label_length Int) (ch Int)
  (names__is_domain_name__result Bool) (names__is_domain_name__result1 Bool)
  (i Int))
  (=> (dynamic_invariant1 name true false true true)
  (=> (dynamic_invariant2 state false false true true)
  (=> (dynamic_invariant3 label_length false false true true)
  (=> (dynamic_invariant ch false false true true)
  (=>
  (exists ((state1 Int))
  (and (= state1 0)
  (exists ((label_length1 Int))
  (and (= label_length1 0)
  (exists ((spark__branch Bool))
  (and
  (= spark__branch (or (ite (< (length name) 1) true false) (ite (< 255 
                                                            (length name))
                                                            true false)))
  (ite (= spark__branch true)
  (= names__is_domain_name__result1 (distinct 0 0))
  (or
  (let ((temp___204 (first1 name)))
  (exists ((i1 Int))
  (and (= i1 temp___204)
  (and
  (= (and (ite (<= temp___204 i1) true false) (ite (<= i1 (last1 name)) true
                                              false)) true)
  (let ((o (- i1 (first1 name))))
  (and (in_range1 o)
  (and (in_range1 (+ o 1))
  (exists ((state2 Int) (label_length2 Int) (ch1 Int) (i2 Int))
  (and (< label_length2 (+ (- i2 (first1 name)) 1))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_property1 (first1 name) (last1 name) i2)
               (dynamic_invariant2 state2 false true true true))
               (dynamic_invariant3 label_length2 false true true true))
               (dynamic_invariant ch1 false true true true))
          true false) (ite (and (<= (first1 name) i2) (<= i2 (last1 name)))
                      true false)) true)
  (exists ((o1 Int))
  (and (= (to_rep (select (to_array name) i2)) o1)
  (exists ((ch2 Int))
  (and (= ch2 o1)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (in_range6 ch2) false true))
  (ite (= spark__branch1 true)
  (= names__is_domain_name__result1 (distinct 0 0))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= state2 0) true false))
  (ite (= spark__branch2 true)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= (is_letter ch2) true) false true))
  (and (= spark__branch3 true)
  (= names__is_domain_name__result1 (distinct 0 0)))))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= state2 1) true false))
  (ite (= spark__branch3 true)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= ch2 46) true false))
  (ite (= spark__branch4 true)
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (< 63 label_length2) true false))
  (and (= spark__branch5 true)
  (= names__is_domain_name__result1 (distinct 0 0)))))
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= ch2 45) true false))
  (and (not (= spark__branch5 true))
  (exists ((spark__branch6 Bool))
  (and
  (= spark__branch6 (ite (= (or (is_letter ch2) (is_digit ch2)) true) false
                    true))
  (and (= spark__branch6 true)
  (= names__is_domain_name__result1 (distinct 0 0)))))))))))
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= ch2 45) true false))
  (and (not (= spark__branch4 true))
  (exists ((spark__branch5 Bool))
  (and
  (= spark__branch5 (ite (= (or (is_letter ch2) (is_digit ch2)) true) false
                    true))
  (and (= spark__branch5 true)
  (= names__is_domain_name__result1 (distinct 0 0)))))))))))))))))))))))))))))))
  (exists ((spark__branch1 Bool) (state2 Int)
  (names__is_domain_name__result2 Bool))
  (and
  (let ((temp___204 (first1 name)))
  (let ((temp___205 (last1 name)))
  (exists ((i1 Int))
  (and (= i1 temp___204)
  (ite (= (and (ite (<= temp___204 i1) true false) (ite (<= i1 temp___205)
                                                   true false)) true)
  (let ((o (- i1 (first1 name))))
  (and (in_range1 o)
  (and (in_range1 (+ o 1))
  (exists ((state3 Int) (label_length2 Int) (ch1 Int) (i2 Int))
  (and (< label_length2 (+ (- i2 (first1 name)) 1))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_property1 (first1 name) (last1 name) i2)
               (dynamic_invariant2 state3 false true true true))
               (dynamic_invariant3 label_length2 false true true true))
               (dynamic_invariant ch1 false true true true))
          true false) (ite (and (<= (first1 name) i2) (<= i2 (last1 name)))
                      true false)) true)
  (exists ((o1 Int))
  (and (= (to_rep (select (to_array name) i2)) o1)
  (exists ((ch2 Int))
  (and (= ch2 o1)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (in_range6 ch2) false true))
  (and (not (= spark__branch2 true))
  (exists ((label_length3 Int))
  (and
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= state3 0) true false))
  (ite (= spark__branch3 true)
  (and (= spark__branch1 (ite (= (is_letter ch2) true) false true))
  (and (not (= spark__branch1 true))
  (and (= state2 1)
  (let ((o2 (+ label_length2 1))) (and (in_range5 o2) (= label_length3 o2))))))
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (= state3 1) true false))
  (ite (= spark__branch4 true)
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= ch2 46) true false))
  (ite (= spark__branch5 true)
  (and (= spark__branch1 (ite (< 63 label_length2) true false))
  (and (not (= spark__branch1 true)) (and (= state2 0) (= label_length3 0))))
  (exists ((spark__branch6 Bool))
  (and (= spark__branch6 (ite (= ch2 45) true false))
  (ite (= spark__branch6 true)
  (and
  (and (= state2 2)
  (let ((o2 (+ label_length2 1))) (and (in_range5 o2) (= label_length3 o2))))
  (= spark__branch1 spark__branch6))
  (and
  (and
  (= spark__branch1 (ite (= (or (is_letter ch2) (is_digit ch2)) true) false
                    true))
  (and (not (= spark__branch1 true))
  (let ((o2 (+ label_length2 1))) (and (in_range5 o2) (= label_length3 o2)))))
  (= state2 state3))))))))
  (exists ((spark__branch5 Bool))
  (and (= spark__branch5 (ite (= ch2 45) true false))
  (ite (= spark__branch5 true)
  (and
  (and
  (let ((o2 (+ label_length2 1))) (and (in_range5 o2) (= label_length3 o2)))
  (= spark__branch1 spark__branch5)) (= state2 state3))
  (and
  (= spark__branch1 (ite (= (or (is_letter ch2) (is_digit ch2)) true) false
                    true))
  (and (not (= spark__branch1 true))
  (and (= state2 1)
  (let ((o2 (+ label_length2 1))) (and (in_range5 o2) (= label_length3 o2)))))))))))))))
  (= i2 temp___205))))))))))))))))
  (and (and (= spark__branch1 spark__branch) (= state2 state1))
  (= names__is_domain_name__result2 names__is_domain_name__result)))))))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= state2 0) true false))
  (ite (= spark__branch2 true)
  (= names__is_domain_name__result1 (distinct 0 0))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= state2 1) true false))
  (ite (= spark__branch3 true)
  (= names__is_domain_name__result1 (distinct 1 0))
  (= names__is_domain_name__result1 (distinct 0 0))))))))))))))))))
  (=> (= names__is_domain_name__result1 true)
  (=> (<= (first1 name) i)
  (=> (<= i (last1 name))
  (or
  (or (= (is_letter (to_rep (select (to_array name) i))) true)
  (= (is_digit (to_rep (select (to_array name) i))) true))
  (= (to_rep (select (to_array name) i)) 45)))))))))))))
(check-sat)
(exit)
